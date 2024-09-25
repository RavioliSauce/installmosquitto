#!/bin/bash

# updates and installs mosquitto
sudo apt-get update

# check if mosquitto is already installed
if dpkg -l | grep -q mosquitto; then
    echo "Mosquitto is already installed."
    exit 0
fi

sudo apt-get install -y mosquitto mosquitto-clients

# start and enable mosquitto
sudo systemctl start mosquitto
sudo systemctl enable mosquitto

# get username and password for MQTT
echo "Enter a username for MQTT:"
read MQTT_USER
echo "Enter a password for MQTT:"
read -s MQTT_PASS

# mosquitto_passwd won't write to file if it doesn't exist
sudo touch /etc/mosquitto/passwd

# mosquitto_passwd obfuscates the password and adds it to the password file
sudo mosquitto_passwd -b /etc/mosquitto/passwd $MQTT_USER $MQTT_PASS

# add new user to mosquitto.conf and disable anonymous access
echo "allow_anonymous false" | sudo tee -a /etc/mosquitto/mosquitto.conf
echo "password_file /etc/mosquitto/passwd" | sudo tee -a /etc/mosquitto/mosquitto.conf

# uncomment next line to change default port from 1883 to 8883 (or any other port you want)
# echo "listener 8883" | sudo tee -a /etc/mosquitto/mosquitto.conf

# restart mosquitto
sudo systemctl restart mosquitto

echo "Mosquitto installation and user setup complete."
