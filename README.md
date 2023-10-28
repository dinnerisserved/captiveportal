# Captive Portal Script

This repository contains two scripts designed to manage network settings and automate the process of handling captive portals. The scripts are divided into two parts: a root-level script (`captiveportal_root.sh`) and a user-level script (`captiveportal_user.sh`).

## Description

- **Root Script (`captiveportal_root.sh`)**: This script performs system-level network configuration tasks and should be executed with `sudo`.
- **User Script (`captiveportal_user.sh`)**: This script handles user-level tasks, such as opening URLs in a web browser. It should be run without `sudo`.

## Usage

### 1. Root Script

Run the root script with superuser privileges to perform necessary system configurations:

```bash
sudo ./captiveportal_root.sh
```

After completion, the script will prompt you to run the user-level script.

### 2. User Script

Run the user script without superuser privileges to open required URLs in your default web browser:

```bash
./captiveportal_user.sh
```

## Scripts

### `captiveportal_root.sh`

This script includes tasks such as managing network connections and firewall settings. It's run with `sudo` and does not require any arguments.

### `captiveportal_user.sh`

This script is responsible for opening URLs in your default web browser. It is run without `sudo` to ensure proper integration with the user's desktop environment.

## Installation

Clone the repository or download the scripts directly. Ensure both scripts are executable:

```bash
chmod +x captiveportal_root.sh
chmod +x captiveportal_user.sh
```

## Requirements

- These scripts are intended for use on Linux systems with NetworkManager and UFW (Uncomplicated Firewall).
- Ensure `xdg-utils` is installed for URL handling.

## Contributing

Contributions, issues, and feature requests are welcome. Feel free to check [issues page](https://github.com/dinnerisserved/captiveportal/issues) if you want to contribute.

## License

Distributed under the MIT License. See `LICENSE` for more information.

Project Link: [https://github.com/yourusername/captiveportal](https://github.com/yourusername/captiveportal)

---
