import supervisely as sly
import time

from torch.utils.tensorboard import SummaryWriter

api: sly.Api = sly.Api.from_env()


import typer
import os


app = typer.Typer()

@app.command()
def train(input_dir, output_dir, team_id, synced_dir):
    """
    Gets data from input_dir, trains a model, generates artefacts as output data,
    and logs the training process. Generated artefacts backed up using synced_dir.
    """
    typer.echo(f"Opening data from {input_dir}...")

    if not os.path.exists(output_dir):
        os.makedirs(output_dir)


    # Start a TensorBoard writer
    writer = SummaryWriter(output_dir)

    typer.echo("Training model...")
    typer.echo(f"Generating output artifacts in {output_dir}...")


    n_iter = 30
    progress = sly.Progress(message='Training...', total_cnt=n_iter)

    for step in range(n_iter):

        time.sleep(5) # imitates training process
        loss = 1.0 / (step + 1)

        # Log the data to TensorBoard
        writer.add_scalar('Loss', loss, step)
        typer.echo(f"Step {step}, loss={loss:.4f}")

        file_path = os.path.join(output_dir, f'step_{str(step).zfill(len(str(50)))}.txt')
        
        with open(file_path, 'w') as f:
            f.write('Step\tLoss\n')
            f.write(f'{step}\t{loss:.4f}\n')

        # backup to synced_dir
        synced_file = os.path.join(
            synced_dir, os.path.basename(file_path)
        )
        api.file.upload(team_id, file_path, synced_file)
        typer.echo(f"File {file_path} backed up to synced dir {synced_dir}!")

        # update progress in workspace tasks interface
        progress.iter_done_report()
               

    # Close the TensorBoard writer
    writer.close()

    
    typer.echo(f"Artefacts generated in {output_dir}!")

    # typer.echo(f"Deleting synced dir...")
    # for filename in api.file.list(SYNCED_DIR):
    #     api.file.remove(TEAM_ID, filename)

    # api.file.d
    # api.file.re


if __name__ == "__main__":
    app()
