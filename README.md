<div align="center" markdown>

<img src="" style="width: 100%;"/>

# Training Tensorboard Template

<p align="center">
  <a href="#Overview">Overview</a> •
  <a href="#Usage">Usage</a> •
  <a href="#how-to-run">How to run</a>
</p>


[![](https://img.shields.io/badge/supervisely-ecosystem-brightgreen)](https://ecosystem.supervise.ly/apps/supervisely-ecosystem/dev-smart-tool-batched)
[![](https://img.shields.io/badge/slack-chat-green.svg?logo=slack)](https://supervise.ly/slack)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/supervisely-ecosystem/dev-smart-tool-batched)
[![views](https://app.supervise.ly/public/api/v3/ecosystem.counters?repo=supervisely-ecosystem/dev-smart-tool-batched&counter=views&label=views)](https://supervise.ly)
[![used by teams](https://app.supervise.ly/public/api/v3/ecosystem.counters?repo=supervisely-ecosystem/dev-smart-tool-batched&counter=downloads&label=used%20by%20teams)](https://supervise.ly)
[![runs](https://app.supervise.ly/public/api/v3/ecosystem.counters?repo=supervisely-ecosystem/dev-smart-tool-batched&counter=runs&label=runs&123)](https://supervise.ly)

</div>

# Overview

This is a bash script (`run.sh`) for running a Tensorboard visualization for a supervisely Project, as well as running a training script (`src/train.py`) and uploading the resulting artefacts to a Team files. During training process all artifacts data stored in synced dir (`$SLY_APP_DATA_DIR`) in case of sudden crush of training process.

# Description

The script will download the project to a temporary directory, run Tensorboard, run the training script, and upload the resulting artifacts to a team folder. 
Note: The `$OUTPUT_DIR` variable is set to `$SLY_APP_DATA_DIR`, which is the directory where synced artifacts data is stored. It is expected that the artifacts will be written to this directory by the training script. The supervisely command-line-interface (cli) is used then to upload the artifacts to a team folder for easy access.

# How to run
Instance way:
- Choose your project and click on three-dot menu. Then, choose `Run App -> Training tensorboard template` and, if you need, specify selected `Advanced Settings`. Click `Run`.
- Wait your project will be downloaded and your tensorboard logging server will run. You can open it in `Workspace Tasks` interface.
- After successful task ending, there will be a direct link to a teamfiles folder.
- In case of crush, you can view stored data in `'Team Files' -> Sypervisely agents -> <chosen node> ('Main node' by default) -> 'app-data' -> 'training-tensorboard-template'`

Local debug way:
- Ensure that all the neccessary (environmental variables)[https://developer.supervise.ly/getting-started/environment-variables] provided in `local.env` and `~/supervisely.env`.
- Run in bash `ENV="development" && ./run.sh` and wait for task end results. 

