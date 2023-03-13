
import subprocess

import os, sys
# Add the 'src' directory to the Python module search path
# sys.path.append(os.path.join(
#     os.getcwd(), 'src')
# )



# import src.globals


# load ENV variables for debug
# has no effect in production
# if sly.is_development():
#     load_dotenv("local.env")


def main():
    subprocess.call("./run.sh", shell=True)

    print('Shell script executed')

    

    


if __name__ == "__main__":
    main()