<div align="center" markdown>
<img src="https://user-images.githubusercontent.com/12828725/228047393-639c9294-214d-4b1a-9b70-c9eec48adb50.jpg">

# Training Tensorboard Template

<p align="center">
  <a href="#Overview">Overview</a> •
  <a href="#How-To-Use">How To Use</a>
</p>

[![](https://img.shields.io/badge/supervisely-ecosystem-brightgreen)](https://ecosystem.supervise.ly)
[![](https://img.shields.io/badge/slack-chat-green.svg?logo=slack)](https://supervise.ly/slack)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/supervisely-ecosystem/training-tensorboard-template)
[![views](https://app.supervise.ly/img/badges/views/supervisely-ecosystem/training-tensorboard-template.png)](https://supervise.ly)

</div>

## Overview

This is a simple training app with bash script entrypoint (`run.sh`) that downloads Supervisely project, runs a Tensorboard to visualize the training metrics, runs training script (`src/train.py`) and uploads the resulting artefacts to a Team files. During the training process, output directory with artefacts is stored in a local directory and can be accessible right in Supervisely platform in your Team Files (Supervisely Agent will serve it automatically).

We recommend you to focus on the two self-explanatory main scripts: `run.sh`, `src/train.py`, `config.json` - to configure app release. In case of any questions, please contact technical support.

Learn more in our [developer portal](https://developer.supervise.ly/app-development/neural-network-integration/training).

# How To Use 

On Supervisely Instance:
- Choose your project and click on three-dot menu. Then, choose `Run App -> Neural Networks -> Training tensorboard template`.
- Wait your project will be downloaded and your tensorboard server will run. Press `Open` button to preview metrics in it.
- Training artefacts will be automatically uploaded to the platform and the app will be stopped.
- In case of crush, you can view stored data in `'Team Files' -> Supervisely agents -> <chosen node> ('Main node' by default) -> 'app-data' -> 'training-tensorboard-template'`

For local debugging:
- Ensure that all the neccessary [environmental variables](https://developer.supervise.ly/getting-started/environment-variables) provided in `local.env` and `~/supervisely.env`.
- Run in bash `ENV="development" && ./run.sh` and wait the results. 