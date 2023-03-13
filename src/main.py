
import subprocess

# import src.globals


# load ENV variables for debug
# has no effect in production
# if sly.is_development():
#     load_dotenv("local.env")


def main():
    subprocess.call("./run.sh", shell=True)

    print('Shell script executed with success')

    


if __name__ == "__main__":
    main()