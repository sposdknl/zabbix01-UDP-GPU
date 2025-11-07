[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/HlDpWB5G)
# zbx7-auto-reg

The independent work - Vagrant and Zabbix Agent2 7.0 LTS - Auto-registration to
[Zabbix pfSense](https://enceladus.pfsense.cz)

# Zabbix pfSense monitoring - Linux distribution by Agent2

Pomocí Vagrant si vytvořte server s libovolnou Linux distribucí. Instalujte
na nej  Zabbix Agent2 a upravte konfiguraci tak, aby se tento host
automaticky registroval na privátní - [Zabbix pfSense](https://enceladus.pfsense.cz).

![Ubuntu Zabbix Agent2](./Images/osy-Ubuntu-ZabbixAgent2.webp)

## Požadované známkované úkoly

- Přihlašte se na Zabbix server Enceladus pod účtem spos a ověřte kolik hostů je monitorováno v tomto zabbixu.
- Vytvořte si adresář s konfigurací, která zajistí deploy Vámi zvolené Linuxové distribuce pomocí Vagrant.
- Vytvořte instalační a konfigurační scripty tak, aby jste nainstalovali Zabbix agent2 verze 7.0 LTS do VM a nastavili konfiguraci agenta pro auto-registraci na Zabbix server enceladus.pfsense.cz. Akce na Enceladu má nastavenu takovou podmínku (Host metadata contains SPOS)
- Výsledný Váš registrovaný host s unikátním jmenem vložte jako Screenshot do adresáře Images.
- Svého registrovaného hosta vyexportuje v libovolném formátu YAML, XML nebo JSON jako soubor a vložte do Vašeho projektu.
- Upravte README.md tak, aby obsahovalo informace o Vašich změnách v tomto zadání.

# Nápověda

- Zabbix 7.0 LTS [auto-registration](https://www.zabbix.com/documentation/7.0/en/manual/discovery/auto_registration)
- [Vagrant examples](https://github.com/sposdknl/2025-sposdk-osy/tree/main/Vagrant)

# Mé změny

![BetaGames Host Image from Zabbix](./Images/BetaGames-Host.png)

Exportovaný Json:
```json
{
    "zabbix_export": {
        "version": "7.0",
        "host_groups": [
            {
                "uuid": "ec50fa856fa542bbba85796d423c2e92",
                "name": "Customer/SPOS"
            }
        ],
        "hosts": [
            {
                "host": "BetaGames",
                "name": "BetaGames",
                "groups": [
                    {
                        "name": "Customer/SPOS"
                    }
                ],
                "interfaces": [
                    {
                        "ip": "86.49.188.67",
                        "dns": "ip-86-49-188-67.net.vodafone.cz",
                        "interface_ref": "if1"
                    }
                ],
                "tags": [
                    {
                        "tag": "OS",
                        "value": "Linux"
                    }
                ],
                "inventory_mode": "AUTOMATIC"
            }
        ]
    }
}
```

# Stučný postup

Lokální příprava:
- Smazal jsem z projektu složku `.\Ubuntu`.
- Vytvořil jsem vlastní složku pod názvem `.\DietPi`.
- Initializoval jsem si základná **Vagrantfile** pomocí `vagrant.exe init dietpi`.
- Přidal jsem skripty na instalaci a configuraci Zabbix agenta.
- Testoval jsem zda vše funguje.

Po navázání spojení:
- Přešel jsem do `Data collection > Hosts > BetaGames` v Zabbix configuraci na adrese `https://enceladus.pfsense.cz`
- Zde jsem pořídil snímek obrazovky (který můžete vidět kousek nahoře v tomto dokumentu).
- Poté jsem zavřel okno, které se objevilo.
- Zaškrtl jsem políčko vedle **BetaGames**.
- Dole se umožnila možnost exportovat jako Json (který také vidíte o kus nahoře).
- Nakonec jsem upravil tento README.md a odevzdal práci jako hotovou.
