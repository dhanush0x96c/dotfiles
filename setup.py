from src.setup import kanata, tmux, vscode, zsh
from src.utils.stow import stow


def main():
    configs = ["zsh", "git", "kanata", "tmux", "kitty", "vscode"]
    for config in configs:
        stow(config)

    zsh.main()
    tmux.main()
    vscode.main()
    kanata.main()


if __name__ == "__main__":
    main()
