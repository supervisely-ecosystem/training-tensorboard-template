# !/bin/bash
# set_shell_env() {
#     output=$(python3 src/export_env.py)
#     eval $output
# }
# # get $PROJECT_NAME
# set_shell_env

python3 src/main.py && \
PROJECT_NAME=`cat project_name.txt` && \
echo "Project name: " $PROJECT_NAME && \
SYNCED_DIR=`cat synced_dir.txt` && \
echo "Synced dir for backup while training: " $SYNCED_DIR && \

# supervisely download-project --project-id ${PROJECT_ID} --save-dir tmp/training_data/ && \
python3 typer_commands.py download-project ${PROJECT_ID} tmp/training_data/ && \


nohup tensorboard --logdir src/artefacts --port 8000  --host 0.0.0.0 --reload_multifile=true --load_fast=false --path_prefix=$BASE_URL &> output & sleep 5 && \
python3 src/train.py tmp/training_data/ tmp/artefacts/ ${TEAM_ID} ${SYNCED_DIR} && \


# supervisely upload-to-teamfiles --team-id ${TEAM_ID} --from-local-dir tmp/artefacts/ --to-teamfiles-dir /upload/${TASK_ID}-${PROJECT_NAME}-${PROJECT_ID}/ && \
python3 typer_commands.py upload-to-teamfiles ${TEAM_ID} tmp/artefacts/ /upload/${TASK_ID}-${PROJECT_NAME}-${PROJECT_ID}/ && \

# remove unnecessary synced_dir files


# supervisely set-task-output-dir --team-id ${TEAM_ID} --task-id ${TASK_ID} --teamfiles-dir /upload/${TASK_ID}-${PROJECT_NAME}-${PROJECT_ID}/
python3 typer_commands.py set-task-output-dir  ${TEAM_ID} ${TASK_ID} /upload/${TASK_ID}-${PROJECT_NAME}-${PROJECT_ID}/