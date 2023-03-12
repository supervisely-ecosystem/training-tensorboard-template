# supervisely (cli) download --project_id=${PROJECT_ID} --save-dir="/a/b/c" && \

tensorboard --logdir src/artefacts --port 8000 && \
python3 src/customers_main.py src/fake_folder/ src/artefacts/ 
# && \

# supervisely (cli) upload_directory --tesm_id=${TEAM_ID} --from="/artifacts" --to="/my-training/{TASK_id}{PROJECT_NAME}-{PROJECT_ID}"
# supervisely (cli) set-task-output-dir ${TASK_ID} "/my-training/{TASK_id}{PROJECT_NAME}-{PROJECT_ID}"