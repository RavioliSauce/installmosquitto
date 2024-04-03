# InstallMosquitto Script

## Introduction
This script automates the process of installing Mosquitto, an open-source MQTT broker, on your Linux system and setting up a user account for the MQTT service.

## Prerequisites
- Linux distribution with `apt-get` (Debian, Ubuntu, etc.)
- `sudo` privileges

## Installation Instructions
1. Clone this repository
2. Navigate to the script directory
3. Make the script executable
4. Run the script
```bash
git clone https://github.com/RavioliSauce/installmosquitto.git
cd installmosquitto
chmod +x installmosquitto.sh
sudo ./installmosquitto.sh
```
### OR
1. Copy contents of the script to a new file on your system
2. Make the script executable: `chmod +x [script name]`
3. Run the script: `sudo ./[script name]`

## Usage
Follow the on-screen prompts to enter a username and password for the MQTT service.

## Configuration Options
The script sets the MQTT service to start automatically and disables anonymous access. To change the default MQTT port (1883), edit the script and modify the `listener` line.

## Security Considerations
Use strong, unique credentials for the MQTT service to ensure it is secure.
