import os
import subprocess
from pathlib import Path

from src.utils import yay


def main():
    if not yay.is_installed("kanata"):
        yay.install("kanata")
    try:
        subprocess.run(["getent", "group", "uinput"], check=True, capture_output=True)
    except subprocess.CalledProcessError:
        subprocess.run(["sudo", "groupadd", "uinput"], check=True)

    user = os.environ["USER"]
    user_groups = subprocess.run(
        ["groups", user], capture_output=True, text=True
    ).stdout

    for grp in ["input", "uinput"]:
        if grp not in user_groups:
            subprocess.run(["sudo", "usermod", "-aG", grp, user], check=True)

    udev_rule = (
        'KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"'
    )
    udev_file = Path("/etc/udev/rules.d/99-input.rules")

    if not udev_file.exists() or udev_rule not in udev_file.read_text():
        subprocess.run(["sudo", "bash", "-c", f"echo '{udev_rule}' >> {udev_file}"])
        subprocess.run(["sudo", "udevadm", "control", "--reload-rules"], check=True)
        subprocess.run(["sudo", "udevadm", "trigger"], check=True)
        subprocess.run(["sudo", "modprobe", "uinput"], check=True)

    result = subprocess.run(
        ["systemctl", "--user", "is-enabled", "kanata.service"], capture_output=True
    )

    if not result.returncode == 0:
        subprocess.run(["systemctl", "--user", "daemon-reload"], check=True)
        subprocess.run(["systemctl", "--user", "enable", "kanata.service"], check=True)
        subprocess.run(["systemctl", "--user", "start", "kanata.service"], check=True)


if __name__ == "__main__":
    main()
