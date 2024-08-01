# MDS PrairieLearn Dockers

PrairieLearn Workspaces require a Docker image with the relevant IDE and languages installed. PrairieLearn provides a base image for both [Python (with Jupyter Lab)](https://hub.docker.com/r/prairielearn/workspace-jupyterlab-python) and [R (with RStudio)](https://hub.docker.com/r/prairielearn/workspace-rstudio). This repository contains the MDS base Dockerfile which provides some additional configuration requirements that are standard across all courses (namely, autosave functionality) for both images. It also contains course specific Dockerfiles to allow instructors to install packages that are specific for that course (e.g. SciPy or palmerpenguins).

### Adding a New Course

1. Create a new folder in this repository named after the course
2. Create the relevant subdirectories for each required language (python or r)
3. Copy one of the existing course Dockerfiles and update the packages
4. Proceed to **Pushing Course to PL**

### Pushing Course to PL (new or updates)

1. Make sure to save any relevant changes to course specific Dockerfile
2. Build Docker with relevant tag 
3. Push Docker to Docker Hub
4. Update `info.json` of each question to match new image and tag
5. Sync questions in PrairieLearn site
6. Sync Docker image to pull the new tag
7. Open Workspace question and test changes

### Updating Base image

1. Make sure to update tag in all Dockerfiles