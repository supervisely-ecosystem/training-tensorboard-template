import os, re

import supervisely as sly
from dotenv import load_dotenv

if sly.is_development():
    load_dotenv("local.env")
    load_dotenv(os.path.expanduser("~/supervisely.env"))

api: sly.Api = sly.Api.from_env()

TEAM_ID = sly.env.team_id()
WORKSPACE_ID = sly.env.workspace_id()
PROJECT_ID = sly.env.project_id()
TASK_ID = sly.env.task_id()

project_info = api.project.get_info_by_id(PROJECT_ID)


def strip_with_replacement(text, replacement):
    return re.sub(r'\s+', replacement, text)
project_name = strip_with_replacement(project_info.name, '_')


with open("project_name.txt", "w") as text_file:
    text_file.write(project_name)


synced_dir = os.path.join(
    sly.app.get_synced_data_dir(),
    f'{TASK_ID}-{project_name}-{PROJECT_ID}'
)

with open("synced_dir.txt", "w") as text_file:
    text_file.write(synced_dir)

