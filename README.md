# Captive Portal Assistant

## Overview
This script is designed to help automate the process of triggering captive portals on public Wi-Fi networks, such as those found in hotels or coffee shops. Captive portals often require users to accept terms, log in, or register on a webpage before they can access the internet. However, sometimes these portals do not open automatically, especially on certain operating systems or under specific network conditions. This script aims to address this issue by performing several actions that can help prompt the captive portal to appear.

## How It Works
The script executes a series of steps to initiate the captive portal:

1. **Disconnect and Reconnect to Wi-Fi**: Initially, the script fetches the SSID of the currently active Wi-Fi connection and then disconnects and reconnects to it. This process can sometimes trigger the network's captive portal detection.

2. **Restart Network Services**: It restarts the Network Manager and flushes the DNS cache. This step ensures that the network settings are reset, and any stale DNS entries are cleared.

3. **Firewall and Proxy Settings**: The script temporarily disables the firewall to prevent it from interfering with the captive portal mechanism. It also manipulates the system proxy settings to encourage the triggering of the portal.

4. **Web Page Requests**: The script attempts to open both an HTTP (`http://example.com`) and an HTTPS (`https://example.com`) website. This is a key step, as captive portals are often triggered by such external web requests. Additionally, it tries opening `http://neverssl.com` and `https://google.com` to cover different scenarios where either HTTP or HTTPS requests might be more effective.

5. **Restore Settings**: Finally, the script re-enables the firewall and resets any changes made to the proxy settings.

## Usage
This section guides you through the process of using the Captive Portal Assistant script.

### Prerequisites
Before running the script, ensure that:
1. **You are using a Linux-based operating system**, preferably Ubuntu or a similar distribution.
2. **You have `nmcli` (Network Manager Command Line Interface) installed**. This tool is typically pre-installed on many Linux distributions.

### Installation
1. **Clone the Repository or Download the Script:**
   - If you're familiar with Git, clone the repository using:
     ```bash
     git clone https://github.com/[your-username]/captiveportal.git
     ```
   - Alternatively, you can download the script directly from the GitHub page.

2. **Navigate to the Script Directory:**
   - If you cloned the repository, navigate to the cloned directory:
     ```bash
     cd captiveportal
     ```
   - If you downloaded the script, navigate to the location where you saved it.

3. **Make the Script Executable:**
   - Grant execution permissions to the script:
     ```bash
     chmod +x captiveportal.sh
     ```

### Running the Script
1. **Connect to a Wi-Fi Network:**
   - Ensure you are connected to the Wi-Fi network that requires a captive portal login.

2. **Execute the Script:**
   - Run the script by typing:
     ```bash
     ./captiveportal.sh
     ```
   - If prompted for a password, enter your user password. This is necessary for commands that require administrative privileges.

3. **Follow On-Screen Instructions:**
   - The script will attempt to trigger the captive portal. Pay attention to any on-screen prompts or browser windows that might open.

4. **Reconnect if Necessary:**
   - If the captive portal does not appear on the first attempt, you may run the script again or manually navigate to a non-HTTPS website (like `http://neverssl.com`) to trigger the portal.

### Post-Execution
- Once you have completed the login steps in the captive portal, your internet access should be established.
- The script will automatically revert any changes it made to the system settings, like re-enabling the firewall.

### Troubleshooting
- If you encounter issues, ensure your Wi-Fi is active and you are within range of the network.
- Check if `nmcli` is correctly installed and functioning on your system.

## Notes
- This script is designed for convenience and is not guaranteed to work on all networks, as captive portal configurations can vary widely.
- Running the script with administrative privileges (using `sudo`) might be necessary depending on your system’s configuration.

## Important Notes
- **Permissions**: Some commands in the script (like manipulating the firewall or network services) require administrative privileges. Make sure to run the script with appropriate permissions.
- **Testing**: It's recommended to test the script in a safe and controlled environment first, as it involves network disconnections and firewall settings.
- **Network Dependency**: The script's effectiveness can vary based on the specific network's captive portal setup and behavior.

## Disclaimer
This script is provided as-is, and it is intended for legitimate purposes such as connecting to public Wi-Fi networks that have captive portals. Users are responsible for ensuring that their use of the script complies with network policies and local laws.

## Contributing
Contributions to enhance the script or suggestions for improvements are always welcome. Please feel free to fork the repository, make changes, and submit a pull request.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


