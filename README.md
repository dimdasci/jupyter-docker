# jupyter-docker
Lightweight docker container with python and jupyter notebook for data science projects.

A notebook equipped with extensions for code formatting and navigation.

## Project structure

The purpose of files and directories are following.

- `Dockerfile` contains instructions to build Docker image with python and jupyter notebook. 
- `requirements.txt` contains python modules needed for the project.
- `Makefile` contains commands 
  - `run_notebook` to build and run container with mounted volumes,
  - `stop_notebook` to stop container.
- `notebooks/` is a working directory for notebooks. 
- `notebooks/data/` is a directory for datasets.

## How to run

Check if all the needed modules are specified in requirements.txt. Then run 

`make run`

You will see an URL to open notebook after container run. Just open it in your browser.

## Working directory

Working directory is set to `./notebooks`. It's mounted to container so you can keep the notebooks on your host disk and work with them in the container. Also there will be `./notebooks/data` folder for your data.

## How to stop

The container will run in detached mode. To stop and remove container it's enough to click on `Quit` button of the Jupyter navigator in your browser.

Another way is to run command 

`make stop`