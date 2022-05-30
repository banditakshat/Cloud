## Cloud.sh
The automation script for gathering cloud assets.

## Getting started

### Installation
    git clone https://github.com/banditakshat/Cloud
    cd Cloud;
    chmod +x install.sh;
    chmod +x cloud.sh;
    ./install.sh
    
## Configuration
Configure your AWS CLI
    
    $ aws configure
    AWS Access Key ID [None]: <AWS Access KEY>
    AWS Secret Access Key [None]: <AWS SECRET KEY>
    Default region name [None]: <Region>
    Default output format [None]: json

## Usage
    ./cloud.sh -t <Target Website> -W <wordlist of target>

## Example:
    ./cloud.sh -t payatu.io -W wordlist.txt

All the s3 bucket names are saved in the `<Target Website>/s3/RawS3.txt` and the dumped data of all s3 buckets is saved into `<Target Website>/s3/dump`.
    
