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

This is a bash script (`run.sh`) that runs a Tensorboard visualization of a Supervisely Project, as well as a training script (`src/train.py`) and uploads the resulting artefacts to a Team files. During the training process, all artefact data is stored in a synced directory (`$SLY_APP_DATA_DIR`) in case of sudden crash.

# Description

The script downloads the project to a directory, runs Tensorboard, runs the training script, and uploads the resulting artefacts to a team folder. 
Note: the `$OUTPUT_DIR` variable is set to `$SLY_APP_DATA_DIR`, which is the directory where synced artifacts data is stored. It is expected that the artefacts will be written to this directory by the training script. The supervisely command-line-interface (cli) is used then to upload the artefacts to a team folder for easy access.

# How to run
Instance way:
- Choose your project and click on three-dot menu. Then, choose `Run App -> Training tensorboard template` and, if you need, specify selected `Advanced Settings`. Click `Run`.
- Wait your project will be downloaded and your tensorboard logging server will run. You can open it in `Workspace Tasks` interface.
- After successful task ending, there will be a direct link to a teamfiles folder.
- In case of crush, you can view stored data in `'Team Files' -> Supervisely agents -> <chosen node> ('Main node' by default) -> 'app-data' -> 'training-tensorboard-template'`

Local debug way:
- Ensure that all the neccessary [environmental variables](https://developer.supervise.ly/getting-started/environment-variables) provided in `local.env` and `~/supervisely.env`.
- Run in bash `ENV="development" && ./run.sh` and wait for task end results. 

