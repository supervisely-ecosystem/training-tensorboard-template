import supervisely as sly

from torch.utils.tensorboard import SummaryWriter


import typer
import os

app = typer.Typer()

def func(arg):
    pass

@app.command()
def makelogs(input_dir: str, output_dir: str):
    """
    Downloads fake data, trains a model, generates artifacts as output data,
    and logs the training process.
    """
    typer.echo(f"Opening fake data from {input_dir}...")


    input_data = []
    for file_name in os.listdir(input_dir):
        file_path = os.path.join(input_dir, file_name)

        if os.path.isfile(file_path):
            with open(file_path, "r") as f:
                input_data.append(f.read())
                print(input_data[-1])


    # Start a TensorBoard writer
    writer = SummaryWriter(output_dir)

    typer.echo("Training model...")


    typer.echo(f"Generating output artifacts in {output_dir}...")

    if not os.path.exists(output_dir):
        os.mkdir(output_dir)

    for step in range(50):

        loss = 1.0 / (step + 1)

        # Log the data to TensorBoard
        writer.add_scalar('Loss', loss, step)

        print(f"Step {step}, loss={loss:.4f}")
               

    # Close the TensorBoard writer
    writer.close()

    # filename = 'artefacts.txt'
    # with open(os.path.join(output_dir,filename), "w") as f:
    #     f.write("This is an artefact file.")
    
    typer.echo(f"Artefacts generated in {output_dir}!")


if __name__ == "__main__":
    app()
