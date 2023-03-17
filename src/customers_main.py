import supervisely as sly
import time

from torch.utils.tensorboard import SummaryWriter

import globals as g

import typer
import os


app = typer.Typer()

@app.command()
def makelogs(input_dir: str, output_dir: str):
    """
    Downloads fake data, trains a model, generates artifacts as output data,
    and logs the training process.
    """
    typer.echo(f"Opening data from {input_dir}...")


    for file_name in os.listdir(input_dir):
        print(file_name)

    if not os.path.exists(output_dir):
        os.makedirs(output_dir)


    # Start a TensorBoard writer
    writer = SummaryWriter(output_dir)
    # writer = tf.summary.create_file_writer(output_dir)


    typer.echo(f'Synced dir: {g.SYNCED_DIR}')
    typer.echo("Training model...")
    typer.echo(f"Generating output artifacts in {output_dir}...")

    n_iter = 30
    progress = sly.Progress(message='Generating data...',total_cnt=n_iter)

    for step in range(n_iter):
        time.sleep(5)
        loss = 1.0 / (step + 1)

        # Log the data to TensorBoard
        writer.add_scalar('Loss', loss, step)
        # tf.summary.scalar('Loss', loss, step)

        typer.echo(f"Step {step}, loss={loss:.4f}")

        file_path = os.path.join(output_dir, f'step_{str(step).zfill(len(str(50)))}.txt')
        
        with open(file_path, 'w') as f:
            f.write('Step\tLoss\n')
            f.write(f'{step}\t{loss:.4f}\n')

        # backup to synced dir
        synced_file = os.path.join(
            g.SYNCED_DIR, os.path.basename(file_path)
        )
        g.api.file.upload(g.TEAM_ID, file_path, synced_file)
        # g.api.file.upload_directory(
        #     g.TEAM_ID, output_dir, g.SYNCED_DIR
        # )
        typer.echo(f"File {file_path} backed up to synced dir {g.SYNCED_DIR}!")

        progress.iter_done_report()
               

    # Close the TensorBoard writer
    writer.close()

    
    typer.echo(f"Artefacts generated in {output_dir}!")

    typer.echo(f"Deleting synced dir...")
    for filename in g.api.file.list(g.SYNCED_DIR):
        g.api.file.remove(g.TEAM_ID, filename)

    # g.api.file.d
    # g.api.file.re


if __name__ == "__main__":
    app()
