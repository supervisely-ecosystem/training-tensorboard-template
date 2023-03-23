# !/bin/bash

if [ "$ENV" = "development" ]
then
    source ~/supervisely.env
    source local.env
fi && 

INPUT_DIR=/tmp/training_data/ # training data
OUTPUT_DIR=$SLY_APP_DATA_DIR # artefacts data

supervisely download --project-id $PROJECT_ID --dst $INPUT_DIR && \

# run tensorboard
# nohup tensorboard --logdir $OUTPUT_DIR --port 8000  --host 0.0.0.0 --reload_multifile=true --load_fast=false --path_prefix=$BASE_URL &> output & sleep 5 && \

echo syncdir:
echo $SLY_APP_DATA_DIR

# training script
python3 src/train.py --input-dir $INPUT_DIR --output-dir $OUTPUT_DIR  && \


PROJECT_NAME=$(supervisely get-project-name --id $PROJECT_ID --replace-space)  && \
# upload artefacts
supervisely upload --team-id $TEAM_ID --src $SLY_APP_DATA_DIR --dst /my-training/${TASK_ID}-${PROJECT_ID}-${PROJECT_NAME}/ && \

# WHAT IF FAIL?

# remove useless synced_dir
# supervisely remove-dir --team-id $TEAM_ID --path $SYNCED_DIR 

# update workspace interface

supervisely set-task-output-dir --team-id $TEAM_ID --task-id $TASK_ID --dir /my-training/${TASK_ID}-${PROJECT_ID}-${PROJECT_NAME}/
