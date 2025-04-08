import os
import shutil
import subprocess

from src.configs import ZSHRC
from src.utils import yay


def main():
    packages = ["bat", "eza", "fzf", "kitty", "less", "stow", "tmux", "zoxide", "zsh"]
    if not yay.is_installed(*packages):
        yay.install(*packages)

    current_shell = os.environ.get("SHELL")
    zsh_path = shutil.which("zsh")
    if current_shell != zsh_path and zsh_path:
        subprocess.run(["chsh", "-s", zsh_path])

    subprocess.run(["zsh", str(ZSHRC)])


if __name__ == "__main__":
    main()
