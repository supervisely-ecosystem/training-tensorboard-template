import os, json, re

import supervisely as sly
from dotenv import load_dotenv


def strip_with_replacement(text, replacement):
    return re.sub(r'\s+', replacement, text)

if sly.is_development():
    load_dotenv("local.env")
    load_dotenv(os.path.expanduser("~/supervisely.env"))

api: sly.Api = sly.Api.from_env()

TEAM_ID = sly.env.team_id()
WORKSPACE_ID = sly.env.workspace_id()
# PROJECT_ID = sly.env.project_id()
PROJECT_ID = 17732

project_info = api.project.get_info_by_id(PROJECT_ID)

PROJECT_NAME = strip_with_replacement(project_info.name, '_')

# print(PROJECT_NAME)

TASK_ID = sly.env.task_id()
# DATASET_ID = sly.env.dataset_id(raise_not_found=False)



