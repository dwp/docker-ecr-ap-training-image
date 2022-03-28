echo -e '{
    "testing": {
        "RecordWrapperType": "None",
        "S3DistributionType": "FullyReplicated",
        "TrainingInputMode": "pipe"
    },
    "training": {
        "RecordWrapperType": "None",
        "S3DistributionType": "FullyReplicated",
        "TrainingInputMode": "pipe"
    }
}' > $SM_INPUT_DATA_CONFIG_FILE

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

echo downloding $ARG_TRAINING_SCRIPT_LOCATION

aws s3 cp $ARG_TRAINING_SCRIPT_LOCATION .

mv tetrain.py /opt/ml/code/tetrain.py
