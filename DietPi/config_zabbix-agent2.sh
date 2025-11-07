#!/bin/bash

# Zabbix config edit
sudo sed -i 's/^Server=.*/Server=enceladus.pfsense.cz/' /etc/zabbix/zabbix_agent2.conf
sudo sed -i 's/^ServerActive=.*/ServerActive=enceladus.pfsense.cz/' /etc/zabbix/zabbix_agent2.conf
sudo sed -i 's/^Hostname=.*/Hostname=BetaGames/' /etc/zabbix/zabbix_agent2.conf
sudo sed -i '/# HostMetadata=/a HostMetadata=SPOS' /etc/zabbix/zabbix_agent2.conf

# Restart zabbix service
sudo systemctl restart zabbix-agent2
