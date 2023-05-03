# !/bin/bash
set -e # This will cause the python script to exit immediately if any command exits with a non-zero status.

if [ "$ENV" = "development" ]
then
    source ~/supervisely.env 
    source local.env 
    export SERVER_ADDRESS 
    export API_TOKEN
fi 

INPUT_DIR_LOCAL="/tmp/training_data/"                   # local training data
OUTPUT_DIR_LOCAL="$SLY_APP_DATA_DIR/output/"            # local output artefacts data
# Note: variable $SLY_APP_DATA_DIR is for synced_data_dir which mirrors artefacts data on teamfiles
PROJECT_NAME=$(supervisely project get-name -id $PROJECT_ID)
HISTORY_DIR="/my-training/"                             # teamfiles history artefacts data
HISTORY_DIR_LOCAL="$SLY_APP_DATA_DIR/history/"          # local history artefacts data
DST_DIR="/my-training/$TASK_ID-$PROJECT_ID-$PROJECT_NAME/" # teamfiles destination directory for output artefacts data

# download project 
supervisely project download -id $PROJECT_ID --dst $INPUT_DIR_LOCAL

# download history artefacts
supervisely teamfiles download -id $TEAM_ID --src "$HISTORY_DIR" --dst "$HISTORY_DIR_LOCAL" --filter ".tfevents." -i

# run tensorboard
nohup tensorboard --logdir_spec output:"$OUTPUT_DIR_LOCAL",history:"$HISTORY_DIR_LOCAL" --port 8000 --host 0.0.0.0 --reload_multifile=true --load_fast=false --path_prefix=$BASE_URL &> output & sleep 5 

# training script
python3 src/train.py --input-dir "$INPUT_DIR_LOCAL" --output-dir "$OUTPUT_DIR_LOCAL"

# upload artefacts
supervisely teamfiles upload -id $TEAM_ID --src "$OUTPUT_DIR_LOCAL" --dst "$DST_DIR"
# set final Team files dir in Workspace tasks
supervisely task set-output-dir -id $TASK_ID --team-id $TEAM_ID  --dir "$DST_DIR"
 
# cleaning the space on agent
echo "Deleting "$SLY_APP_DATA_DIR" contents"
rm -rf "$SLY_APP_DATA_DIR/*"
