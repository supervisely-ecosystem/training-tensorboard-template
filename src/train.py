import argparse
import os
import time
import random
import torch
from torch.utils.tensorboard import SummaryWriter
import supervisely as sly


def train(input_dir: str, output_dir: str) -> None:
    """
    train model on input_dir, log metrics to tensorboard, save artefacts to output_dir
    """

    print(f"Input directory with training data: {input_dir}")
    # hint: transform data in supervisely format to the format your training script understands

    print(f"Training started, artefacts will be saved to {output_dir} ...")
    os.makedirs(output_dir, exist_ok=True)

    # Start a TensorBoard writer
    writer = SummaryWriter(output_dir)

    iters = 150
    steepness = random.uniform(0.01, 10.0)
    progress = sly.Progress(message="Training...", total_cnt=iters)
    for step in range(iters):
        time.sleep(0.1)  # imitates training process
        loss = 1.0 / (steepness * (step + 1))

        print(f"Step [{step}]: loss={loss:.4f}")
        writer.add_scalar("Loss", loss, step)  # Log smth to TensorBoard

        # save fake checkpoint every 30 iterations
        if step != 0 and step % 30 == 0:
            torch.save(
                {"iter": step, "model_state_dict": {"a": "b"}, "loss": loss},
                os.path.join(output_dir, f"{step:05d}.pt"),
            )

        progress.iter_done_report()  # log to view progress bar in Supervisely

    # Close the TensorBoard writer
    writer.close()
    print("Training finished")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Training tensorboard template")
    parser.add_argument("--input-dir", "-i", required=True, help="Input dir with training data")
    parser.add_argument("--output-dir", "-o", required=True, help="Dir for training artefacts")

    args = parser.parse_args()
    train(args.input_dir, args.output_dir)
