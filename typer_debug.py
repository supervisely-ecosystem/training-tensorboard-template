import supervisely as sly
import typer
import os
import shutil

import globals_debug as g

app = typer.Typer()

@app.command('download-project')
def download(project_id: int, save_dir: str):
    """
    Downloads fake data, trains a model, generates artifacts as output data,
    and logs the training process.
    """
    typer.echo(f"Downloading data from {project_id} to directory: {save_dir}")

    # breakpoint()

    if os.path.exists(save_dir):
        shutil.rmtree(save_dir)

    sly.download_project(g.api, project_id, save_dir)
    
    typer.echo(f"Project saved to {save_dir}")


@app.command('upload-to-teamfiles')
def upload_directory(team_id: int, from_dir: str, to_dir: str):
    """
    Downloads fake data, trains a model, generates artifacts as output data,
    and logs the training process.
    """
    typer.echo(f"Upload data for team {team_id} from {from_dir} to directory: {to_dir}")


    g.api.file.upload_directory(
        team_id, from_dir, to_dir,
        change_name_if_conflict=True
    )

    typer.echo(f"Data uploaded to teamfiles, directory: {to_dir}")


@app.command('set-task-output-dir')
def set_task_output_dir(team_id, task_id: int, remote_dir: str):
    """
    Downloads fake data, trains a model, generates artifacts as output data,
    and logs the training process.
    """

    # .listdir() not working with environmental variables
    files = g.api.file.list2(team_id, remote_dir, recursive=False)

    
    file_info = g.api.file.get_info_by_path(
        team_id, 
        files[0].path
    )

    g.api.task.set_output_directory(task_id, file_info.id, remote_dir)
    
    typer.echo(f"Setting finished.")

@app.command('remove-dir')
def remove(team_id, path):

    g.api.file.remove(team_id, path)

    typer.echo(f"Directory {path} deleted")


if __name__ == "__main__":
    app()
