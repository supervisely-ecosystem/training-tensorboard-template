<div align="center" markdown>
<img src="https://user-images.githubusercontent.com/12828725/228047393-639c9294-214d-4b1a-9b70-c9eec48adb50.jpg">

# Training Tensorboard Template

<p align="center">
  <a href="#Overview">Overview</a>
</p>

[![](https://img.shields.io/badge/supervisely-ecosystem-brightgreen)](https://ecosystem.supervise.ly)
[![](https://img.shields.io/badge/slack-chat-green.svg?logo=slack)](https://supervise.ly/slack)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/supervisely-ecosystem/training-tensorboard-template)
[![views](https://app.supervise.ly/img/badges/views/supervisely-ecosystem/training-tensorboard-template.png)](https://supervise.ly)

</div>

## Overview

This is a simple training app with bash script entrypoint (`run.sh`) that downloads Supervisely project, runs a Tensorboard to visualize the training metrics, runs training script (`src/train.py`) and uploads the resulting artefacts to a Team files. During the training process, output directory with artefacts is stored in a local directory and can be accessible right in Supervisely platform in your Team Files (Supervisely Agent will serve it automatically).

We recommend you to focus on the two self-explanatory main scripts: `run.sh`, `src/train.py`, `config.json`. In case of any questions, please contact technical support.


# How To Use 

1. Run app from the context menu of directory of file in **Team Files** -> `Run app` -> `Tensorboard`

2. Wait for the app to import your data (project will be created in the current workspace)

3. Stop app manually once you finish with it.

<img src="https://user-images.githubusercontent.com/12828725/228075685-2946d65c-bba9-4a7e-90f7-66ee1cf5f77e.gif">











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


# Description

The script downloads the project to a directory, runs Tensorboard, runs the training script, and uploads the resulting artefacts to a team folder. 
Note: the `$OUTPUT_DIR` variable is set to `$SLY_APP_DATA_DIR`, which is the directory where synced artifacts data is stored. It is expected that the artefacts will be written to this directory by the training script. The supervisely command-line-interface (cli) is used then to upload the artefacts to a team folder for easy access.

# How to run
On Supervisely Instance:
- Choose your project and click on three-dot menu. Then, choose `Run App -> Neural Networks -> Training tensorboard template`.
- Wait your project will be downloaded and your tensorboard server will run. Press `Open` button to preview metrics in it.
- Training artefacts will be automatically uploaded to the platform and the app will be stopped.
- In case of crush, you can view stored data in `'Team Files' -> Supervisely agents -> <chosen node> ('Main node' by default) -> 'app-data' -> 'training-tensorboard-template'`

For local debugging:
- Ensure that all the neccessary [environmental variables](https://developer.supervise.ly/getting-started/environment-variables) provided in `local.env` and `~/supervisely.env`.
- Run in bash `ENV="development" && ./run.sh` and wait the results. 