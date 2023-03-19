# !/bin/bash
set_shell_env() {
    output=$(python3 src/export_env.py)
    eval $output
}
# get $PROJECT_NAME
set_shell_env

supervisely download-project --project-id ${PROJECT_ID} --save-dir tmp/training_data/ && \


nohup tensorboard --logdir src/artefacts --port 8000  --host 0.0.0.0 --reload_multifile=true --load_fast=false --path_prefix=$BASE_URL &> output & sleep 5 && \
python3 src/train.py tmp/training_data/ tmp/artefacts/ && \


supervisely upload-to-teamfiles --team-id ${TEAM_ID} --from-local-dir tmp/artefacts/ --to-teamfiles-dir /upload/${TASK_ID}-${PROJECT_NAME}-${PROJECT_ID}/ && \

supervisely set-task-output-dir --team-id ${TEAM_ID} --task-id ${TASK_ID} --teamfiles-dir /upload/${TASK_ID}-${PROJECT_NAME}-${PROJECT_ID}/
