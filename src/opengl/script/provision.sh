#!/bin/bash
start="$(date +%s)"

echo "Provisioning Environment"
echo "-----------------------------"
echo "Installing libraries..."
apt-get -y install cmake make g++ git pkg-config mesa-common-dev
apt-get -y install freeglut3 freeglut3-dev libglew1.6 libglew1.6-dev libglu1-mesa libglu1-mesa-dev libgl1-mesa-glx libgl1-mesa-dev
apt-get -y install premake4 libcr-dev
apt-get -y install mesa-common-dev libglu1-mesa-dev libxrandr-dev libxi-dev libxcursor-dev libx11-dev libxinerama-dev

echo "-----------------------------"
echo "Installing software..."
add-apt-repository ppa:eugenesan/ppa -y
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

apt-get -y update
apt-get -y install smartgithg firefox google-chrome-stable

end="$(date +%s)"
echo "-----------------------------"
echo "Provisioning complete in "$(expr $end - $start)" seconds"