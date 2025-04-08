import subprocess


def is_installed(*extensions):
    """Check if all the given VSCode extensions are installed."""
    installed_extensions = subprocess.check_output(
        ["code", "--list-extensions"], text=True
    ).splitlines()
    return all(ext in installed_extensions for ext in extensions)


def install(*extensions):
    """Install the given VSCode extensions."""
    for ext in extensions:
        subprocess.run(["code", "--install-extension", ext], check=True)


def uninstall(*extensions):
    """Uninstall the given VSCode extensions."""
    for ext in extensions:
        subprocess.run(["code", "--uninstall-extension", ext], check=True)
