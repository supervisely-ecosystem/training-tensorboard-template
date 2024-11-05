<div align="center" markdown>
<img src="https://user-images.githubusercontent.com/12828725/228047393-639c9294-214d-4b1a-9b70-c9eec48adb50.jpg">

# Training Tensorboard Template

<p align="center">
  <a href="#Overview">Overview</a> •
  <a href="#How-To-Use">How To Use</a>
</p>

[![](https://img.shields.io/badge/supervisely-ecosystem-brightgreen)](https://ecosystem.supervisely.com)
[![](https://img.shields.io/badge/slack-chat-green.svg?logo=slack)](https://supervisely.com/slack)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/supervisely-ecosystem/training-tensorboard-template)
[![views](https://app.supervisely.com/img/badges/views/supervisely-ecosystem/training-tensorboard-template.png)](https://supervisely.com)

</div>

## Overview

This is a simple training app with bash script entrypoint (`run.sh`) that downloads Supervisely project, runs a Tensorboard to visualize the training metrics, runs training script (`src/train.py`) and uploads the resulting artefacts to a Team files. During the training process, output directory with artefacts is stored in a local directory and can be accessible right in Supervisely platform in your Team Files (Supervisely Agent will serve it automatically).

We recommend you to focus on the two self-explanatory main scripts: `run.sh`, `src/train.py`. To release modified template as a private app use `supervisely release` bash command (Learn more [here](https://developer.supervisely.com/app-development/basics/add-private-app)). In case of any questions, please contact technical support.

Learn more in ℹ️ [this tutorial](https://developer.supervisely.com/app-development/neural-network-integration/training/tensorboard-template) on Supervisely Developer portal.

# 🤓 What should you pay attention to

1. The proposed structure of saved training runs will look like:

```text
.
└── my-training
    └── <project-id-1>-<project-name-1>
        └── <task-id-1-1> # here your artefacts data of <task-id-1-1> stored
        └── <task-id-1-2> # same for <task-id-1-2>
        └── <task-id-1-3> # etc.
        └── ...
    └── <project-id-2>-<project-name-2>
        └── <task-id-2-1>
        └── <task-id-2-2>
        └── ...

```

Note, that you can always change `DST_DIR` in the `run.sh` in any way it will suit your needs.

2. You can always load your previous logs just by simply specifying `HISTORY_DIR` in `run.sh`. Here how it will look like in the tensorboard interface:

![Tensorboard logs with history logs of previous runs](https://user-images.githubusercontent.com/78355358/236162006-5dceeb9a-39fa-46a7-9834-eb5c4c1cba89.gif)

Note, that the script will automatically ignore non-existence of the history folder, even if you do not have any history logs (i.e. `*.tfevents.*` files). It means that you do not need to bother about additional `run.sh` customization!

3. The `SLY_APP_DATA_DIR` variable represents a synced data directory that connects locally stored files in a container with the Team files directory.

This allows the data to be viewed and copied on the remoted directory in Team files. This directory serves as a backup for the training artefacts in case the training script suddenly crashes. You can view the saved data in `Team Files` -> `Supervisely agents` -> `<chosen node>` ('Main node' by default) -> `app-data` -> `training-tensorboard-template`.

4. If you want to release the private application, don't forget to update the `config.json` file: change the `categories` and `context_menu` fields. Check out the examples for these field values that we stored in `_categories` and `_context_menu` (and remove these examples).

# How To Use

On Supervisely Instance:

- Choose your project and click on three-dot menu. Then, choose `Run App -> Neural Networks -> Training tensorboard template`.
- Wait your project will be downloaded and your tensorboard server will run. Press `Open` button to preview metrics in it.
- Training artefacts will be automatically uploaded to the platform and the app will be stopped.
- In case of crush, you can view stored data in `'Team Files' -> Supervisely agents -> <chosen node> ('Main node' by default) -> 'app-data' -> 'training-tensorboard-template'`

For local debugging:
- Ensure that all the neccessary [environmental variables](https://developer.supervisely.com/getting-started/environment-variables) provided in `local.env` and `~/supervisely.env`.
- Run in bash `ENV="development" && ./run.sh` and wait the results. 
