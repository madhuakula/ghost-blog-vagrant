# Author : Madhu Akula 
# Bootstrap script for Ghost Blogging framework using Vagrant & Ubuntu 14.04

# Updating the ubuntu repo and installing necessary softwares
sudo apt-get update -y 
sudo apt-get install -y unzip
sudo apt-get install -y build-essential

# For generating the github static pages
sudo apt-get install -y python-pip
sudo apt-get install python-lxml
sudo pip install buster


# Downloading and installed the node software for ghost framework
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs



# Downloading the ghost 
curl -L https://ghost.org/zip/ghost-latest.zip -o ghost.zip

# Creating directory and setup in directory structure
sudo mkdir -p /opt/ghost
sudo unzip -uo ghost.zip -d /opt/ghost

# Change to root user
sudo su -
cd /opt/ghost

# Install the node dependencies
npm install --production

# Editing the configuration
cp config.example.js config.js

sed -i '1,/127.0.0.1/s/127.0.0.1/0.0.0.0/' config.js

# Starting as permenent 
nohup npm start --production > Ghost-Output.out 2> Ghost-Error.err < /dev/null  &
