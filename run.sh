#!/bin/bash

screen -S xvnc -d -m x11vnc -display :0 -wait 50 -noxdamage -auth guess -viewonly -forever

screen -S novnc -d -m ./vnc/novnc_proxy

if [ ! -d fastapi_app_env ]; then
  ./install.sh
fi

screen -S python_app -d -m source ./fastapi_app_env/bin/activate; python main.py
