# MDS PrairieLearn Dockers

PrairieLearn Workspaces require a Docker image with the relevant IDE and languages installed. PrairieLearn provides a base image for both [Python (with Jupyter Lab)](https://hub.docker.com/r/prairielearn/workspace-jupyterlab-python) and [R (with RStudio)](https://hub.docker.com/r/prairielearn/workspace-rstudio). This repository contains the MDS base Dockerfile which provides some additional configuration requirements that are standard across all courses (namely, autosave functionality) for both images. It also contains course specific Dockerfiles to allow instructors to install packages that are specific for that course (e.g. SciPy or palmerpenguins).

Unsure of where to go next? Please take a look at our [operations flowchart](./flowchart.png) for how to proceed.

### Base Images

Our base images extensions of the defautls provided by PrairieLearn. These include [Python (with Jupyter Lab)](https://hub.docker.com/r/prairielearn/workspace-jupyterlab-python) and [R (with RStudio)](https://hub.docker.com/r/prairielearn/workspace-rstudio). The purpose of these base images is to define requirements that are mandatory for all MDS courses.

- Current considerations
  - Autosave
  - Datasets
  - Packages

The instructions provided here assume you have cloned the repository to your computer and have Docker installed. This is due to the fact we **strongly** recommend testing locally before pushing any changes to this repository.

#### Creating a New Base Image

Currently we provided two base images, one for [Python](./base-python/) and one for [R](./base-r/). These instructions are provided to cover the steps required for implementing a new base image such as for providing a new language (SQL) or for topics that have multiple courses (Visualisation 1 and 2). However, very careful consideration is required to ensure that the image is needed to avoid introducing additional points of failure in the process (for example, forgetting to update an image because it uses a non-standard base).

##### Instructions
1. Create a new folder in the root directory eg. `base-sql`
2. Create the Dockerfile with any relevant requirements
3. Build and test the Dockerfile both locally and manually in a PrairieLearn Workspace environment
4. Create a `yml` file in [.github/workflows](./.github/workflows/) with the relevant information
5. Push image to repository and wait for Github action to run
6. Grab the name and tag from the [MDS Dockerhub](https://hub.docker.com/u/ubcmds)
7. Follow the instructions for [Creating](#creating-a-new-course) or [Updating](#updating-an-existing-course) a course to implement the image

#### Updating a Base Image

If a requirement changes that affects all courses, such as changing a dataset or implementing a new version of a package, you will need to update the base image accordingly. These instructions presume that a base image was already [created](#creating-a-new-base-image) at some point.

##### Instructions
1. Locate the Dockerfile of the relevant image
2. Update the requirements 

### Course Images

> Defining a course image

#### Creating a New Course

1. Create a new folder in this repository named after the course
2. Create the relevant subdirectories for each required language (python or r)
3. Copy one of the existing course Dockerfiles and update the packages
4. Proceed to **Pushing Course to PL**

#### Updating an Existing Course

> Instructions to update course

### Updating PrairieLearn

> Define update to PL

#### Update Questions

> Instructions for updating questions

#### Sync to PrairieLearn

> Instructions for Syncing to PL


### FAQ

##### Q1. My change is not showing in the PrairieLearn Workspace
###### A1. Make sure you have updated the questions to the new image tag and have synced both the questions and Docker image to PrairieLearn

---

> Old instructions

### Pushing Course to PL (new or updates)

1. Make sure to save any relevant changes to course specific Dockerfile
2. Build Docker with relevant tag 
3. Push Docker to Docker Hub
4. Update `info.json` of each question to match new image and tag
5. Sync questions in PrairieLearn site
6. Sync Docker image to pull the new tag
7. Open Workspace question and test changes




