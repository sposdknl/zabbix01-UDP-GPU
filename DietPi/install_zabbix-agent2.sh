#!/bin/bash

# This is official install steps from https://www.zabbix.com/download?zabbix=7.0&os_distribution=debian&os_version=13&components=agent_2
# Update packages
sudo apt-get update -y
sudo apt-get upgrade -y

# Download zabbix repo .deb
curl -qL "https://repo.zabbix.com/zabbix/7.0/debian/pool/main/z/zabbix-release/zabbix-release_latest_7.0+debian13_all.deb" -o "./zabbix-release_latest_7.0+debian13_all.deb"
sudo dpkg -i "./zabbix-release_latest_7.0+debian13_all.deb"
sudo apt-get update -y

# Install zabbix agent2 and its plugins
sudo apt-get install -y zabbix-agent2 zabbix-agent2-plugin-mongodb zabbix-agent2-plugin-mssql zabbix-agent2-plugin-postgresql

# Enable autostart
sudo systemctl restart zabbix-agent2
sudo systemctl enable zabbix-agent2
