# FROM supervisely/base-py-sdk:latest
FROM tensorflow/tensorflow

USER root

# RUN pip install supervisely
# RUN pip install tensorboard
# RUN pip install typer
# RUN pip install torch

WORKDIR /sly-app-data

COPY /src /repo/src
COPY /run.sh /repo/run.sh

