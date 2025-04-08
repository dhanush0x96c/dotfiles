import subprocess


def is_installed(*package_names: str) -> bool:
    """Check if one or more packages are installed."""
    try:
        for package_name in package_names:
            subprocess.run(
                ["yay", "-Q", package_name],
                check=True,
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
            )
        return True
    except subprocess.CalledProcessError:
        return False


def install(*package_names: str) -> None:
    """Install one or more packages."""
    try:
        subprocess.run(["yay", "-S", *package_names], check=True)
        print(f"Packages '{', '.join(package_names)}' installed successfully.")
    except subprocess.CalledProcessError:
        print(f"Failed to install packages '{', '.join(package_names)}'.")


def uninstall(*package_names: str) -> None:
    """Uninstall one or more packages."""
    try:
        subprocess.run(["yay", "-R", *package_names], check=True)
        print(f"Packages '{', '.join(package_names)}' uninstalled successfully.")
    except subprocess.CalledProcessError:
        print(f"Failed to uninstall packages '{', '.join(package_names)}'.")


def update_database() -> None:
    """Update the package database."""
    try:
        subprocess.run(["yay", "-Sy"], check=True)
        print("Package database updated successfully.")
    except subprocess.CalledProcessError:
        print("Failed to update package database.")


def system_update() -> None:
    """Perform a full system update."""
    try:
        subprocess.run(["yay", "-Syu"], check=True)
        print("System updated successfully.")
    except subprocess.CalledProcessError:
        print("Failed to update the system.")
