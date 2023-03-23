# !/bin/bash
set -e # This will cause the script to exit immediately if any command exits with a non-zero status.

if [ "$ENV" = "development" ]
then
    source ~/supervisely.env && \
    source local.env
fi && \

INPUT_DIR="/tmp/training_data/"     # training data 
OUTPUT_DIR=$SLY_APP_DATA_DIR  # artefacts data $SLY_APP_DATA_DIR is for synced_data_dir which backups training artefacts
PROJECT_NAME=$(supervisely get-project-name --id $PROJECT_ID)  

# echo $ENV && \
# echo $INPUT_DIR && \
# echo $OUTPUT_DIR && \
# echo $PROJECT_NAME && \

# download project
supervisely download --project-id $PROJECT_ID --dst $INPUT_DIR && \

# run tensorboard
nohup tensorboard --logdir $OUTPUT_DIR --port 8000  --host 0.0.0.0 --reload_multifile=true --load_fast=false --path_prefix=$BASE_URL &> output & sleep 5 && \

# training script
python3 src/train.py --input-dir $INPUT_DIR --output-dir $OUTPUT_DIR  && \


# upload artefacts
supervisely upload --team-id $TEAM_ID --src $OUTPUT_DIR --dst "/my-training/$TASK_ID-$PROJECT_ID-$PROJECT_NAME/" && \
echo Removing output directory $OUTPUT_DIR  && \
supervisely remove-dir --team-id $TEAM_ID --path $OUTPUT_DIR && \


# update workspace interface
supervisely set-task-output-dir --team-id $TEAM_ID --task-id $TASK_ID --dir "/my-training/$TASK_ID-$PROJECT_ID-$PROJECT_NAME/"
