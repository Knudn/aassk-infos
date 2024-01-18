#!/bin/bash



if [ ! -d fastapi_app_env ]; then
  ./install.sh
fi
source ./fastapi_app_env/bin/activate

screen -S python_app -d -m python main.py

screen -S xvnc -d -m x11vnc -display :0 -wait 50 -noxdamage -auth guess -viewonly -forever

screen -S novnc -d -m ./vnc/novnc_proxy
