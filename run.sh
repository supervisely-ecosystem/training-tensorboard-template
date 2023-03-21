# !/bin/bash
# python3 src/main.py && \

# if [ "$ENV" = "development" ]
# then
#     source local.env
#     source ~/supervisely.env
# fi && \
TASK_ID=29463 && \
WORKSPACE_ID=691 && \
PROJECT_ID=17732 && \
TEAM_ID=449  && \

supervisely download-project --id ${PROJECT_ID} --dir tmp/training_data/ && \
# python3 typer_commands.py download-project ${PROJECT_ID} tmp/training_data/ && \

# run tensorboard
# nohup tensorboard --logdir tmp/artefacts --port 8000  --host 0.0.0.0 --reload_multifile=true --load_fast=false --path_prefix=$BASE_URL &> output & sleep 5 && \

SYNCED_DIR=$(supervisely get-synced-dir)  && \


# training script
python3 src/train.py tmp/training_data/ tmp/artefacts/ $TEAM_ID $SYNCED_DIR && \


PROJECT_NAME=$(supervisely get-project-name --project-id $PROJECT_ID --replace-space)  && \

# upload artefacts
supervisely upload-to-teamfiles --team-id ${TEAM_ID} --from-local-dir tmp/artefacts/ --to-teamfiles-dir /my-training/${TASK_ID}-${PROJECT_NAME}-${PROJECT_ID}/ && \
# python3 typer_commands.py upload-to-teamfiles ${TEAM_ID} tmp/artefacts/ /upload/${TASK_ID}-${PROJECT_NAME}-${PROJECT_ID}/ && \

# remove useless synced_dir
supervisely remove-dir --team-id $TEAM_ID --path $SYNCED_DIR 
# python3 typer_commands.py remove-teamfiles $TEAM_ID $SYNCED_DIR && \

# update worscpace interface
supervisely set-task-output-dir --team-id ${TEAM_ID} --task-id ${TASK_ID} --teamfiles-dir /my-training/${TASK_ID}-${PROJECT_NAME}-${PROJECT_ID}/
# python3 typer_commands.py set-task-output-dir  ${TEAM_ID} ${TASK_ID} /upload/${TASK_ID}-${PROJECT_NAME}-${PROJECT_ID}/