#!/bin/bash

source ./fastapi_app_env/bin/activate

x11vnc -display :0 -wait 50 -noxdamage -auth guess -viewonly -forever &
./vnc/novnc_proxy &

if [ ! -d fastapi_app_env ]; then
  ./install.sh
fi

python main.py
