#!/bin/bash

curl -o /app/data/help_crack.py https://wpa-sec.stanev.org/hc/help_crack.py # Download newest version
exec python3 /app/data/help_crack.py --pot /app/data/cracked.potfile