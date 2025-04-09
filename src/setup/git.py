from src.utils import yay


def main():
    packages = ["git-delta", "git", "github-cli", "lazygit"]
    if not yay.is_installed(*packages):
        yay.install(*packages)


if __name__ == "__main__":
    main()
