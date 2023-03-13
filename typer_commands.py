import supervisely as sly
import typer
import os
import shutil


import src.globals_ as g

app = typer.Typer()


@app.command('download')
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
    
    typer.echo(f"Project saved to {save_dir}!")


@app.command('upload-directory')
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
def set_task_output_dir(task_id: int, remote_dir: str):
    """
    Downloads fake data, trains a model, generates artifacts as output data,
    and logs the training process.
    """

    
    files = g.api.file.listdir(g.TEAM_ID, remote_dir)
    
    file_info = g.api.file.get_info_by_path(
        g.TEAM_ID, files[0]
    )

    g.api.task.set_output_directory(task_id, file_info.id, remote_dir)
    
    typer.echo(f"set_output_directory finished: {remote_dir}")


if __name__ == "__main__":
    app()
