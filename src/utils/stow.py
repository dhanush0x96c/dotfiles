import subprocess


def stow(target: str):
    subprocess.run(["stow", target])
