#!/bin/bash
while getopts t:w: flag

do
        case "${flag}" in
                t) target=${OPTARG}
                        ;;
                w) wordlist=${OPTARG}
                         ;;
                *) echo "Invalid option: -$flag" ;;
        esac
done

if [[ $target == "" ]]; then
    echo "You must provide a -t flag";
    exit 1;
elif [[ $wordlist == "" ]]; then
    echo "you must provide a -w flag";
    exit 1;
fi

echo "S3recon Starting...................................................";
mkdir -p $target/s3;
s3recon $wordlist --public | grep PUBLIC | cut -d " " -f 3 | tee $target/s3/s3recon.txt

echo "Slurp Starting.....................................................";
wget https://raw.githubusercontent.com/0xbharath/slurp/master/permutations.json -O $target/s3/permutations.json;
slurp domain -c 25 -p $target/s3/permutations.json -t $target >>  $target/s3/slurp.txt;

echo "clubbing all.................................................";
cat $target/s3/*.txt |sort -u | grep $target | tee $target/s3/RawS3.txt;

echo "S3scanner Starting.................................................";
mkdir -p $target/s3/dump ;
s3scanner scan --threads 8 --dangerous --buckets-file $target/s3/RawS3.txt | grep bucket_exist | tee $target/s3/s3scanner.txt ;
s3scanner dump -f $target/s3/s3scanner.txt  -d $target/s3/dump;





