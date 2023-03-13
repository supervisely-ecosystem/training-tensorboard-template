#!/bin/bash

# supervisely (cli) download --project_id=${PROJECT_ID} --save-dir="/a/b/c" && \
python3 src/download_project.py 17732 src/download/ && \

tensorboard --logdir src/artefacts --port 8000 && \
python3 src/customers_main.py src/download/ds1/img src/artefacts/ && \

# supervisely (cli) upload_directory --tesm_id=${TEAM_ID} --from="/artifacts" --to="/my-training/{TASK_id}{PROJECT_NAME}-{PROJECT_ID}"
python3 src/typer_commands.py upload_directory 449 src/download/ds1/img/ uploaddir/
# && \

python3 src/typer_commands.py set-task-output-dir 28577 uploaddir/
# supervisely (cli) set-task-output-dir ${TASK_ID} "/my-training/{TASK_id}{PROJECT_NAME}-{PROJECT_ID}"