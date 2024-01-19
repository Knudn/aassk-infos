#!/bin/bash

# Update package list
sudo apt-get update

# Install Python 3 and pip
sudo apt-get install -y python3 python3-pip python3-virtualenv screen firefox-esr

# Create a virtual environment for the application
virtualenv fastapi_app_env

# Activate the virtual environment
source fastapi_app_env/bin/activate

# Install FastAPI, Uvicorn, and SQLAlchemy in the virtual environment
pip install fastapi uvicorn sqlalchemy requests uvicorn[standard]

# Deactivate the virtual environment
deactivate

echo "Installation complete. Run 'source fastapi_app_env/bin/activate' to activate the virtual environment."
