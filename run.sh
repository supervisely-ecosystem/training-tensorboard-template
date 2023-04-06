# !/bin/bash
set -e # This will cause the python script to exit immediately if any command exits with a non-zero status.

if [ "$ENV" = "development" ]
then
    source ~/supervisely.env 
    source local.env 
    export SERVER_ADDRESS 
    export API_TOKEN
fi 

INPUT_DIR="/tmp/training_data/"     # training data 
OUTPUT_DIR=$SLY_APP_DATA_DIR        # artefacts data 
# Note: variable $SLY_APP_DATA_DIR is for synced_data_dir which mirrors artefacts data on teamfiles
PROJECT_NAME=$(supervisely project get-name -id $PROJECT_ID)

# download project 
supervisely project download -id $PROJECT_ID --dst $INPUT_DIR

# run tensorboard
# nohup tensorboard --logdir $OUTPUT_DIR --port 8000  --host 0.0.0.0 --reload_multifile=true --load_fast=false --path_prefix=$BASE_URL &> output & sleep 5 

# training script
# python3 src/train.py --input-dir $INPUT_DIR --output-dir $OUTPUT_DIR  

# upload artefacts
supervisely teamfiles upload -id $TEAM_ID --src $INPUT_DIR --dst "/my-training/$TASK_ID-$PROJECT_ID-$PROJECT_NAME/" 


supervisely task set-output-dir -id $TASK_ID --team-id $TEAM_ID  --dir "/my-training/$TASK_ID-$PROJECT_ID-$PROJECT_NAME/"

# supervisely task set-output-dir -id $TASK_ID --team-id $TEAM_ID  --dir "/empty/"

# supervisely task set-output-dir -id $TASK_ID --team-id $TEAM_ID  --dir  "/empty/"
# supervisely task set-output-dir --dir  "/my-training/$TASK_ID-$PROJECT_ID-$PROJECT_NAME/"


# cleaning the space on agent
echo "Deleting '$OUTPUT_DIR' contents"
rm -rf $OUTPUT_DIR/*