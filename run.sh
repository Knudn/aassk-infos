#!/bin/bash



if [ ! -d fastapi_app_env ]; then
  ./install.sh
fi
source ./fastapi_app_env/bin/activate

screen -S python_app -d -m python main.py

if lsb_release -a 2>/dev/null | grep -q 'Distributor ID:\s*Raspbian'; then
    echo "Raspbian detected"
    screen -S xvnc -d -m x11vnc -display :0 -wait 50 -noxdamage -forever

else
    echo "Not Raspbian"
    screen -S xvnc -d -m x11vnc -display :0 -wait 50 -noxdamage -auth guess -viewonly -forever

fi

screen -S novnc -d -m ./vnc/novnc_proxy
