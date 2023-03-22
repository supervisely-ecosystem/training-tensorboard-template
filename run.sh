# !/bin/bash


ENV="development" # uncomment if debug
if [ "$ENV" = "development" ]
then
    source local.env
    source ~/supervisely.env
fi && \

# supervisely download-project --id ${PROJECT_ID} --dir tmp/training_data/ && \
python3 typer_debug.py download-project ${PROJECT_ID} tmp/training_data/ && \

# python3 globals_debug.py && \
# SYNCED_DIR=`cat synced_dir.txt` && \
# echo "Synced dir for backup while training: " $SYNCED_DIR && \

# run tensorboard
nohup tensorboard --logdir $SYNCED_DIR --port 8000  --host 0.0.0.0 --reload_multifile=true --load_fast=false --path_prefix=$BASE_URL &> output & sleep 5 && \

# only debug

# SYNCED_DIR=`cat synced_dir.txt` && \
# echo "Synced dir for backup while training: " $SYNCED_DIR && \

# SYNCED_DIR=$(supervisely get-synced-dir)  && \
# training script
python3 src/train.py --input-dir tmp/training_data/ --output-dir $SYNCED_DIR && \


# PROJECT_NAME=$(supervisely get-project-name --id $PROJECT_ID --replace-space)  && \

# upload artefacts
# supervisely upload-to-teamfiles --team-id ${TEAM_ID} --local-dir $SYNCED_DIR --remote-dir /my-training/${TASK_ID}-${PROJECT_ID}-${PROJECT_NAME}/ && \
python3 typer_debug.py upload-to-teamfiles ${TEAM_ID} $SYNCED_DIR /my-training/${TASK_ID}-${PROJECT_ID}-${PROJECT_NAME}/ && \

WHAT IF FAIL?

# remove useless synced_dir

# supervisely remove-dir --team-id $TEAM_ID --path $SYNCED_DIR 
python3 typer_debug.py remove-dir $TEAM_ID $SYNCED_DIR && \


# update workspace interface

# supervisely set-task-output-dir --team-id ${TEAM_ID} --task-id ${TASK_ID} --teamfiles-dir /my-training/${TASK_ID}-${PROJECT_ID}-${PROJECT_NAME}/
python3 typer_debug.py set-task-output-dir  ${TEAM_ID} ${TASK_ID} /my-training/${TASK_ID}-${PROJECT_ID}-${PROJECT_NAME}/
