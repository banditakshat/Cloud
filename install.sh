#!/bin/bash
pip3 install s3scanner;
pip3 install s3recon;
wget https://github.com/0xbharath/slurp/releases/download/1.1.0/slurp-1.1.0-linux-amd64 ;
mv slurp-1.1.0-linux-amd64 slurp;
chmod +x slurp ;
sudo cp slurp /usr/bin/ ;
echo "before using the cloud.sh script, first configure aws cli for better results"
