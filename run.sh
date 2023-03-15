#!/bin/bash

# set_shell_env() {
#     output=$(python3 src/export_env.py)
#     eval $output
# }
# set_shell_env

# echo prName is: $PROJECT_NAME

# supervisely (cli) download --project_id=${PROJECT_ID} --save-dir="/a/b/c" && \
# python3 typer_commands.py download ${PROJECT_ID} src/download/ && \
# sly-cli download ${PROJECT_ID} src/download/ && \

# nohup tensorboard --logdir src/artefacts --port 8000 & python3 src/customers_main.py src/download/ds1/img src/artefacts/

# nohup tensorboard --logdir src/artefacts --port 8000 & \
# python3 src/customers_main.py src/download/ds1/img src/artefacts/ && \

# supervisely (cli) upload_directory --tesm_id=${TEAM_ID} --from="/artifacts" --to="/my-training/{TASK_id}{PROJECT_NAME}-{PROJECT_ID}"
# python3 typer_commands.py upload-directory ${TEAM_ID} src/artefacts/ /uploaddir/${TASK_ID}-${PROJECT_NAME}-${PROJECT_ID}/ && \
# sly-cli upload-directory ${TEAM_ID} src/download/ds1/img/ /uploaddir/${TASK_ID}-${PROJECT_NAME}-${PROJECT_ID}/ && \
# && \

# supervisely (cli) set-task-output-dir ${TASK_ID} "/my-training/{TASK_id}{PROJECT_NAME}-{PROJECT_ID}"
# python3 typer_commands.py set-task-output-dir ${TASK_ID} /uploaddir/${TASK_ID}-${PROJECT_NAME}-${PROJECT_ID}/

tensorboard --logdir src/artefacts --port 8000 --host 0.0.0.0