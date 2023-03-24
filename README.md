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

This is a bash script for running a Tensorboard visualization for a supervisely Project, as well as running a training script and uploading the resulting artifacts to a Team files. All artifacts data stored in 

This template allows you to run your personal training code (`src/train.py`) on supervisely Projects and upload results in supervisely. teamfiles.


 opened in and  download and trim YouTube videos directly to your video editing project. After specifying the video URL, with only one click, you can download and trim the video and add it to your project. The trimmed videos will include metadata from YouTube, such as the title and description. Additionally, the app will notify you about possible license issues and video licenses.
For example, you enter a link for a videoclip of a popular song, such as this one, choose the available metadata, and click on "Download" (Don't forget to input your YouTube v3 API key, either manually or by importing a teamfile). After that, you can specify the trimming segment of the video (or leave it untouched) and push the video to the selected project and dataset (or create new ones). Once done, the video clip will be uploaded to the Supervisely dataset with all the necessary metadata. For more details, please refer to the How To Run section.

# Usage

Edit the local.env file to set the environment variables as needed.
Run the script with bash training_tensorboard_template.sh.
The script will download the project to a temporary directory, run Tensorboard, run the training script, and upload the resulting artifacts to a team folder. The output will be logged to a file called output.
Note: The OUTPUT_DIR variable is set to $SLY_APP_DATA_DIR, which is the directory where synced artifacts data is stored. It is expected that the artifacts will be written to this directory by the training script. The supervisely-cli is used to upload the artifacts to a team folder for easy access.

# How to run
ENV="development" && ./run.sh

