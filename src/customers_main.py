import supervisely as sly

import typer
import os

app = typer.Typer()

def func(arg):
    pass

@app.command()
def train_model(input_dir: str, output_dir: str):
    """
    Downloads fake data, trains a model, generates artifacts as output data,
    and logs the training process.
    """
    typer.echo(f"Opening fake data from {input_dir}...")

    fake_data = []
    for file_name in os.listdir(input_dir):
        file_path = os.path.join(input_dir, file_name)

        if os.path.isfile(file_path):
            with open(file_path, "r") as f:
                fake_data.append(f.read())
                print(fake_data[-1])

        # print(contents)

    typer.echo("Training model...")
    
    for i in range(10):
        func(fake_data)
        print(f'Log train cycle {i}...')

    typer.echo(f"Generating output artifacts in {output_dir}...")

    if not os.path.exists(output_dir):
        os.mkdir(output_dir)
    
    filename = 'artefacts.txt'
    with open(os.path.join(output_dir,filename), "w") as f:
        f.write("This is an artefact file.")
    
    typer.echo(f"Artefacts generated in {output_dir}!")


if __name__ == "__main__":
    app()
