#!/bin/bash

source ./fastapi_app_env/bin/activate

x11vnc -display :0 -wait 50 -noxdamage -auth guess -viewonly -forever &
./vnc/novnc_proxy &

python main.py
