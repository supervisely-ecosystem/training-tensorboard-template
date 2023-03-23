import supervisely as sly
import time

import typer
import os

from torch.utils.tensorboard import SummaryWriter

app = typer.Typer()


@app.command()
def train(    
        input_dir: str = typer.Option(..., "--input-dir", "-i", help="Input directory"),
        output_dir: str = typer.Option(..., "--output-dir", "-o", help="Output directory"),
    ):
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

    n_iter = 10
    progress = sly.Progress(message='Training...', total_cnt=n_iter)


    for step in range(n_iter):

        time.sleep(5) # imitates training process
        loss = 1.0 / (step + 1)

        # Log the data to TensorBoard
        writer.add_scalar('Loss', loss, step)
        typer.echo(f"Step {step}, loss={loss:.4f}")

        file_path = os.path.join(output_dir, f'step_{str(step).zfill(len(str(n_iter)))}.txt')
        
        with open(file_path, 'w') as f:
            f.write('Step\tLoss\n')
            f.write(f'{step}\t{loss:.4f}\n')

        progress.iter_done_report()
               
    # Close the TensorBoard writer
    writer.close()

    typer.echo(f"Artefacts generated in {output_dir}!")

if __name__ == "__main__":
    app()
