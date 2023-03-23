import argparse
import os
import time

import supervisely as sly
from torch.utils.tensorboard import SummaryWriter

def train(input_dir: str, output_dir: str) -> None:
    """
    Gets data from input_dir, trains a model, generates artefacts as output data,
    and logs the training process. Generated artefacts backed up using synced_dir.
    """
    print(f"Opening data from {input_dir}...")

    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # Start a TensorBoard writer
    writer = SummaryWriter(output_dir)

    print("Training model...")
    print(f"Generating output artifacts in {output_dir}...")

    n_iter = 3
    progress = sly.Progress(message='Training...', total_cnt=n_iter)

    for step in range(n_iter):

        time.sleep(5) # imitates training process
        loss = 1.0 / (step + 1)

        # Log the data to TensorBoard
        writer.add_scalar('Loss', loss, step)
        print(f"Step [{step}]: loss={loss:.4f}")

        file_path = os.path.join(output_dir, f'step_{str(step).zfill(len(str(n_iter)))}.txt')
        
        with open(file_path, 'w') as f:
            f.write(f"Step [{step}]: loss={loss:.4f}")

        progress.iter_done_report()

    # Close the TensorBoard writer
    writer.close()

    print(f"Artefacts generated in {output_dir}!")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Training tensorboard template")
    parser.add_argument("--input-dir", "-i", required=True, help="Input directory")
    parser.add_argument("--output-dir", "-o", required=True, help="Output directory")

    args = parser.parse_args()

    train(args.input_dir, args.output_dir)

