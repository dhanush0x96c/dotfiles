from src.utils import code, yay


def main():
    if not yay.is_installed("visual-studio-code-bin"):
        yay.install("visual-studio-code-bin")

    extensions = [
        "catppuccin.catppuccin-vsc",
        "eamodio.gitlens",
        "esbenp.prettier-vscode",
        "github.copilot-chat",
        "github.copilot",
        "ms-python.vscode-pylance",
        "pkief.material-icon-theme",
    ]

    if not code.is_installed(*extensions):
        code.install(*extensions)


if __name__ == "__main__":
    main()
