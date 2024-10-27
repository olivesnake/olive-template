import os
import platform
import subprocess
import venv

IS_WINDOWS = platform.system().lower() == "windows"
SCRIPTS_DIR = os.path.join(
    "venv",
    "Scripts" if IS_WINDOWS else "bin"
)

if __name__ == '__main__':
    # create virtual environemnt
    if not os.path.exists("./venv"):
        try:
            venv.create(
                env_dir="venv",
                with_pip=True
            )
        except Exception as e:
            print("an error occurred trying to create the virtual environment: {}".format(e))
            exit(1)

    # install python packages
    if IS_WINDOWS:
        subprocess.run(
            [os.path.join(SCRIPTS_DIR, "pip.exe"), "install", "-r", "requirements.txt"]
        )
    else:
        subprocess.run(
            f"source {SCRIPTS_DIR} && pip install -r requirements",
            shell=True
        )

    # install node packages
    subprocess.run(["npm", "install"])

    print("setup completedy succesfully!")
