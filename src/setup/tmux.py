import subprocess

from src.configs import HOME
from src.utils import git, yay


def main():
    if not yay.is_installed("tmux"):
        yay.install("tmux")

    git.clone("https://github.com/tmux-plugins/tpm", (HOME / ".tmux/plugins/tpm"))

    subprocess.run(
        ["sh", str(HOME / ".tmux/plugins/tpm/scripts/install_plugins.sh")],
        capture_output=True,
    )


if __name__ == "__main__":
    main()
