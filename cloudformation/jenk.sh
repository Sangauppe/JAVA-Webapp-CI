#!/bin/bash

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# aws configure set aws_access_key_id "$ACCESS_KEY"
# aws configure set aws_secret_access_key "$SECRET_KEY"
# aws configure set region "${params.region}"

sudo apt install docker.io -y
sudo chmod 777 /var/run/docker.sock
sudo apt install python3-pip -y
pip3 install awscli --upgrade --user
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/kubernetes.list
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -y
sudo apt-get install -y kubectl
