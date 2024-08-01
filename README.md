# MDS PrairieLearn Dockers

PrairieLearn Workspaces require a Docker image with the relevant IDE and languages installed. PrairieLearn provides a base image for both [Python (with Jupyter Lab)](https://hub.docker.com/r/prairielearn/workspace-jupyterlab-python) and [R (with RStudio)](https://hub.docker.com/r/prairielearn/workspace-rstudio). This repository contains the MDS base Dockerfile which provides some additional configuration requirements that are standard across all courses (namely, autosave functionality) for both images. It also contains course specific Dockerfiles to allow instructors to install packages that are specific for that course (e.g. SciPy or palmerpenguins).

Unsure of where to start? Please take a look at our [operations flowchart](./utilities/flowchart.png) for how to proceed. Or if you are still stuck, please contact one of the [MDS team](https://ubc-mds.github.io/team/).

---

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
3. Build and test the Dockerfile both locally and in a PrairieLearn Workspace environment
4. Create a `yml` file in [.github/workflows](./.github/workflows/) with the relevant information
5. Push updates to repository and wait for Github action to run
6. Grab the name and tag from the [MDS Dockerhub](https://hub.docker.com/u/ubcmds)
7. Follow the instructions for [Creating](#creating-a-new-course) or [Updating](#updating-an-existing-course) a course to implement the image

#### Updating a Base Image

If a requirement changes that affects all courses, such as changing a dataset or implementing a new version of a package, you will need to update the base image accordingly. These instructions presume that a base image was already [created](#creating-a-new-base-image) at some point.

##### Instructions
1. Locate the Dockerfile of the relevant image
2. Make the relevant changes to the file
3. Build and test the Dockerfile both locally and in a PrairieLearn Workspace environment
4. Push updates to repository and wait for Github action to run
5. Grab the name and tag from the [MDS Dockerhub](https://hub.docker.com/u/ubcmds)
6. Follow the instructions for [Updating a course](#updating-an-existing-course) to implement the changes

---

### Course Images

Each course should have it's own image to install any packages or settings that are specific to the workspace of that course. Do not use the image for another course as it may be updated without you knowing and could cause your workspace to break if the tag gets updated.

#### Creating a New Course

1. Create a new folder in this repository named after the course (eg. `531`)
2. Create the relevant subdirectories for each required language (eg. `531/python`, `531/r`)
3. Copy one of the existing course Dockerfiles and update the packages or create your own from scratch
4. Grab the name and tag from the [MDS Dockerhub](https://hub.docker.com/u/ubcmds) for the most recent base image.
5. Update `FROM ubcmds` in Dockerfile to match the base image
6. Build and test the Dockerfile both locally and in a PrairieLearn Workspace environment
7. Follow the instructions for [Updating Questions](#update-questions) to implement the changes

#### Updating an Existing Course

1. Grab the name and tag from the [MDS Dockerhub](https://hub.docker.com/u/ubcmds) for the most recent base image. **Note:** you (or someone else) may have changed this in the [Updating a Base Image](#updating-a-base-image) instructions since the last course update
2. Update `FROM ubcmds` in Dockerfile to match the base image
3. Make any further updates to the Dockerfile that you require
4. Build and test the Dockerfile both locally and in a PrairieLearn Workspace environment
5. Push updates to repository and wait for Github action to run
6. Follow the instructions for [Updating Questions](#update-questions) to implement the changes

---

### Updating PrairieLearn

Every time an image is updated, you need to ensure that the questions in your course are updated to reflect the changes. This involves both modifying the individual questions to use the new image and syncing the updated image to the course (similar to how you would sync changes to a question).

#### Creating Questions

If you are creating a workspace question for the first time, please follow the instructions in our [Autotest Migration](https://github.com/VincentLiu3/prairielearn-migrationa-autotest) repository to learn how to create a workspace question

#### Update Questions

1. Make sure have the correct tag from the [MDS Dockerhub](https://hub.docker.com/u/ubcmds) for the most recent changes made in the course image (eg. `ubcmds/531-r:052d124`)
2. Run the `utilities/update_image.py` script with the correct parameters. See [Using update_image](#using-update_imagepy) for details on this script
3. Follow the instructions for [Syncing to  PrairieLearn](#sync-to-prairielearn) to push the changes

#### Sync to PrairieLearn

1. Open PrairieLearn to the sync page for the course. See the [Instructor Guide](https://github.com/UBC-MDS/prairielearn-instructor-guide) if you are unsure where this is
2. Click on `Pull from remote repository` to update questions
3. After it has completed return to the sync page
4. Click on `Sync` next to all Docker Images
5. Verify that the `Image Name` matches the desired version from [MDS Dockerhub](https://hub.docker.com/u/ubcmds) (eg. `ubcmds/531-r:052d124`)
6. Specifically test for the new changes in a workspace question (eg. import a new package)

If the updates are not reflected in your PrairieLearn workspace, check the FAQ and flowchart to ensure you have made the correct changes.

---

### Utilities

This section is to provide further details on the additional utilities included with this repository.

#### Using `update_image.py`

> These instructions are to be updated once the script is updated to match the Github actions workflows

#### Updating the flowchart

The [flowchart](./utilities/flowchart.png) is provided as a visual guide on what instructions to follow when making changes in this repository. If the workflow of this repository changes, the flowchart may need to be updated. This diagram was created using [draw.io](https://app.diagrams.net/) and can be updated using the associated [docker.drawio](./utilities/docker.drawio) file.

---

### FAQ

Here are some frequently asked questions when using this repository.

##### Q1. My change is not showing in the PrairieLearn Workspace
> A1. Make sure you have [updated the questions](#update-questions) to the new image tag and have [synced](#sync-to-prairielearn) both the questions and Docker image to PrairieLearn

##### Q2. The flowchart does not have what I am looking for
> A2. You may need to update the flowchart using [Update Flowchart](#updating-the-flowchart) instructions 



