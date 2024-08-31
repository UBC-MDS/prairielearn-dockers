# MDS PrairieLearn Dockers

This repository is intended as a collection of Docker Images that are used by the [MDS team](https://ubc-mds.github.io/team/) at the [University of British Columbia](https://ubc.ca) for their PrairieLearn courses. This involves a combination of [Workspace](https://prairielearn.readthedocs.io/en/latest/workspaces/) images and [External Autograder](https://prairielearn.readthedocs.io/en/latest/externalGrading/) images. The information of what each of these are and how to use or create them are detailed below.

#### Workspaces

PrairieLearn Workspaces require a Docker image with the relevant IDE and languages installed. The PrairieLearn team provides a base image for both [Python (with Jupyter Lab)](https://hub.docker.com/r/prairielearn/workspace-jupyterlab-python) and [R (with RStudio)](https://hub.docker.com/r/prairielearn/workspace-rstudio). This repository contains the MDS base Dockerfile which provides some additional configuration requirements that are standard across all courses (namely, autosave functionality) for both images. It also contains course specific Dockerfiles to allow instructors to install packages that are specific for that course (e.g. SciPy or palmerpenguins).

#### Scratchpads

Due to limitations in how simulataneous Workspaces operate (specifically RStudio - see [FAQ](#q4-my-rstudio-workspaces-keep-refreshing-on-their-own)), you may not be able have multiple Workspaces open during a quiz. In the future, Workspaces may be switched to a singular IDE for both languages (Python and R). Until then, the recommended solution for courses requiring RStudio workspaces is to create a Scratchpad question. The existing course specific workspace images have been designed to work in this instance. Therefore, the only changes required are in the course repository. Please see the appropriate heading for Scratchpads in the [Instructor Guide](https://github.com/UBC-MDS/prairielearn-instructor-guide) for how to configure a Scratchpad.

#### External Autograder

PrairieLearn also has the capability to use Docker images to grade questions, typically those involving user created code. Similar to their workspaces images, the PrairieLearn team provides their own images for [Python](https://hub.docker.com/r/prairielearn/grader-python) and [R](https://hub.docker.com/r/prairielearn/grader-r) among [other languages](https://hub.docker.com/u/prairielearn). This repository contains the Dockerfiles utilised in our courses that are based upon these images but install additional packages that are not already include (e.g. infer).

#### Naming Images

The naming of images is important due to the way our `update_image.py` script works. A Workspace image must be in the format of `ubcmds/{name}-{language}` and an External Autograder image must be in the format of `ubcmds/{name}-autograder-{language}`. In both instances, name can be any alpha-numeric characters and language must be either `python` or `r` (others can be added if needed). The script should be robust enough to catch for incorrect names but it is possible edge cases have been missed. Please pay close attention to these requirements when creating an image. The tag of the image will always be automatically generated based on the Github commit. `Latest` should not be used at any point.

#### Existing Packages

Please make sure to check the images upstream when creating and updating images in this repository. For Workspaces, please check the relevant Docker Hub images hosted by PrairieLearn ([Python](https://hub.docker.com/r/prairielearn/workspace-jupyterlab-python) and [R](https://hub.docker.com/r/prairielearn/workspace-rstudio)) and our own *base* images ([Python](./base-python/) and [R](./base-r/)). We do not have *base* images for External Graders and instead build directly downstream of  the PrairieLearn images ([Python](https://hub.docker.com/r/prairielearn/grader-python) and [R](https://hub.docker.com/r/prairielearn/grader-r)).

#### Where to start?

Unsure of where to start? Please take a look at our [operations flowchart](./utilities/flowchart.png) for how to proceed. Or if you are still stuck, please contact one of the [MDS team](https://ubc-mds.github.io/team/).

---

## Base Workspace Images

Our base images extensions of the defautls provided by PrairieLearn. These include [Python (with Jupyter Lab)](https://hub.docker.com/r/prairielearn/workspace-jupyterlab-python) and [R (with RStudio)](https://hub.docker.com/r/prairielearn/workspace-rstudio). The purpose of these base images is to define requirements that are mandatory for all MDS courses.

- Current considerations
  - Autosave
  - Datasets
  - Packages

The instructions provided here assume you have cloned the repository to your computer and have Docker installed. This is due to the fact we **strongly** recommend testing locally before pushing any changes to this repository.

### Creating a New Base Workspace Image

Currently we provided two base images, one for [Python](./base-python/) and one for [R](./base-r/). These instructions are provided to cover the steps required for implementing a new base image such as for providing a new language (SQL) or for topics that have multiple courses (Visualisation 1 and 2). However, very careful consideration is required to ensure that the image is needed to avoid introducing additional points of failure in the process (for example, forgetting to update an image because it uses a non-standard base).

#### Instructions
1. Create a new folder in the root directory eg. `base-sql`
2. Create the Dockerfile with any relevant requirements
3. Build and test the Dockerfile both locally and in a PrairieLearn Workspace environment
4. Create a `yml` file in [.github/workflows](./.github/workflows/) with the relevant information
5. Push updates to repository and wait for Github action to run
6. Grab the name and tag from the [MDS Dockerhub](https://hub.docker.com/u/ubcmds)
7. Follow the instructions for [Creating](#creating-a-new-course) or [Updating](#updating-an-existing-course) a course to implement the image

### Updating a Base Workspace Image

If a requirement changes that affects all courses, such as changing a dataset or implementing a new version of a package, you will need to update the base image accordingly. These instructions presume that a base image was already [created](#creating-a-new-base-image) at some point. 

**Note:** updating a base image will require you to update all courses that use this image to a new tag. Please only update base images if *absolutely necessary*.

#### Instructions
1. Locate the Dockerfile of the relevant image
2. Make the relevant changes to the file
3. Build and test the Dockerfile both locally and in a PrairieLearn Workspace environment
4. Push updates to repository and wait for Github action to run
5. Grab the name and tag from the [MDS Dockerhub](https://hub.docker.com/u/ubcmds)
6. Follow the instructions for [Updating a course](#updating-an-existing-course) to implement the changes

---

## Course Workspace Images

Each course should have it's own image to install any packages or settings that are specific to the workspace of that course. Do not use the image for another course as it may be updated without you knowing and could cause your workspace to break if the tag gets updated.

### Creating a New Course Workspace Image

1. Create a new folder in this repository named after the course (eg. `531`)
2. Create the relevant subdirectories for each required language (eg. `531/python`, `531/r`)
3. Copy one of the existing course [Dockerfiles](531/r/Dockerfile) and update the packages or create your own from scratch
4. Grab the name and tag from the [MDS Dockerhub](https://hub.docker.com/u/ubcmds) for the most recent base image.
5. Update `FROM ubcmds` in Dockerfile to match the base image
6. Build and test the Dockerfile both locally and in a PrairieLearn Workspace environment
7. Follow the instructions for [Updating Questions](#update-questions) to implement the changes

### Updating an Existing Course Workspace Image

1. Grab the name and tag from the [MDS Dockerhub](https://hub.docker.com/u/ubcmds) for the most recent base image. **Note:** you (or someone else) may have changed this in the [Updating a Base Image](#updating-a-base-image) instructions since the last course update
2. Update `FROM ubcmds` in Dockerfile to match the base image
3. Make any further updates to the Dockerfile that you require (e.g. change packages in `ENV R_PACKAGES=""`)
4. Build and test the Dockerfile both locally and in a PrairieLearn Workspace environment
5. Push updates to repository and wait for Github action to run
6. Follow the instructions for [Updating Questions](#update-questions) to implement the changes

---

## External Autograder Images

Given that the only changes required for External Autograder Images is installing new packages, the MDS does not have it's own *Base Image* like we do for Workspace images. Instead, all of our Course External Autograder images are directly on-top of the ones provided by the [PrairieLearn Team](https://hub.docker.com/u/prairielearn).

### Creating a New External Autograder Image

1. Create a new folder in this repository named after the course (eg. `531`)
2. Create the relevant subdirectories for each required language (eg. `531/autograder-python`, `531/autograder-r`)
3. Copy one of the existing External Autograder Image [Dockerfiles](552/autograder-r/Dockerfile) and update the packages or create your own from scratch
4. Grab the name and tag from the [PrairieLearn Dockerhub](https://hub.docker.com/u/prairielearn) for the most recent external grader base image.
5. Update `FROM *` in Dockerfile to match the base image
6. Build and test the Dockerfile both locally and in a PrairieLearn Workspace environment
7. Follow the instructions for [Updating Questions](#update-questions) to implement the changes

### Updating an Existing External Autograde Image

1. Grab the name and tag from the [PrairieLearn Dockerhub](https://hub.docker.com/u/prairielearn) for the most recent external grader base image.
2. Navigate to the relevant Dockerfile (e.g. `552/autograder-r/Dockerfile`)
3. Update `FROM *` in Dockerfile to match the base image
4. Make any further updates to the Dockerfile that you require (e.g. change packages in `ENV R_PACKAGES=""`)
5. Build and test the Dockerfile both locally and in a PrairieLearn Workspace environment
6. Push updates to repository and wait for Github action to run
7. Follow the instructions for [Updating Questions](#update-questions) to implement the changes

---

## Updating PrairieLearn

Every time an image is updated, you need to ensure that the questions in your course are updated to reflect the changes. This involves both modifying the individual questions to use the new image and syncing the updated image to the course (similar to how you would sync changes to a question).

### Creating Questions

If you are creating a workspace question for the first time, please follow the instructions in our [Autotest Migration](https://github.com/VincentLiu3/prairielearn-migrationa-autotest) repository to learn how to create a workspace question.

### Update Questions

1. Make sure have the correct tag from the [MDS Dockerhub](https://hub.docker.com/u/ubcmds) for the most recent changes made in the course image (eg. `ubcmds/531-r:052d124`)
2. Run the `utilities/update_image.py` script with the correct parameters. See [Using update_image](#using-update_imagepy) for details on this script
3. Follow the instructions for [Syncing to  PrairieLearn](#sync-to-prairielearn) to push the changes

### Sync to PrairieLearn

1. Open PrairieLearn to the sync page for the course. See the [Instructor Guide](https://github.com/UBC-MDS/prairielearn-instructor-guide) if you are unsure where this is
2. Click on `Pull from remote repository` to update questions
3. After it has completed return to the sync page
4. Click on `Sync` next to all Docker Images
5. After it has completed return to the sync page
6. Verify that the `Image Name` matches the desired version from [MDS Dockerhub](https://hub.docker.com/u/ubcmds) (eg. `ubcmds/531-r:052d124`)
7. Specifically test for the new changes in a workspace question (eg. import a new package)

If the updates are not reflected in your PrairieLearn workspace, check the FAQ and flowchart to ensure you have made the correct changes.

---

## Utilities

This section is to provide further details on the additional utilities included with this repository.

### Using `update_image.py`

Please remeber that all images must be in the format `ubcmds/{name}-{language}` as explained at the top of this file. 

The `update_image.py` script has the following options:

| Arguments           | Function                                                    | Values                                                              | Required |
|---------------------|-------------------------------------------------------------|---------------------------------------------------------------------|----------|
| `--pl_repo`         | Provide the location of the questions to update             | A directory                                                         | ✓        |
| `--question_folder` | Used if you only want to update a single question at a time | A directory (must be inside `--pl_repo`)                            |          |
| `--language`        | The language used in the provided image                     | R, Python, ...                                                      | ✓        |
| `--image`           | The `ubcmds` Dockerhub image name                           | `ubcmds/{name}-{language}` or `ubcmds/{name}-autograder-{language}` | ✓        |
| `--image_type`      | What type of image are you updating                         | workspace or autograder                                             | ✓        |
| `--tag`             | The tag of the image named after the git commit             | alpha-numeric value                                                 | ✓        |
| `--log_output`      | Used to save the logs to a file when running                | console (default), file, both, *.txt                                |          |

#### Format

> ````
> python utilities/update_image.py --pl_repo <> --question_folder <> --language <> --image <> --image_type <> --tag <> --log_output <>
> ````

#### Examples

> To update all R workspace questions in 531 to a new version and save the output to a specific filename
> > ````
> > python utilities/update_image.py --pl_repo ../pl-ubc-dsci531/ --language r --image ubcmds/531-r --image_type workspace --tag abcdefg --log_output 531-r.txt
> >````

> To update a single Python workspace question in 571 to a new version
> > ````
> > python utilities/update_image.py --pl_repo ../pl-ubc-dsci571/ --question_folder others/workspace_test --language python --image ubcmds/571-python --image_type workspace --tag abcdefg
> >````

> To update all R External Autograder image and log output to console and a file
> > ````
> > python utilities/update_image.py --pl_repo ../pl-ubc-dsci531/ --language r --image ubcmds/531-r --image_type autograder --tag abcdefg --log_output both
> > ````

### Updating the flowchart

The [flowchart](./utilities/flowchart.png) is provided as a visual guide on what instructions to follow when making changes in this repository. If the workflow of this repository changes, the flowchart may need to be updated. This diagram was created using [draw.io](https://app.diagrams.net/) and can be updated using the associated [docker.drawio](./utilities/docker.drawio) file.

---

## FAQ

Here are some frequently asked questions when using this repository.

##### Q1. My change is not showing in the PrairieLearn Workspace
> A1. Make sure you have [updated the questions](#update-questions) to the new image tag and have [synced](#sync-to-prairielearn) both the questions and Docker image to PrairieLearn

##### Q2. The flowchart does not have what I am looking for
> A2. You may need to update the flowchart using [Update Flowchart](#updating-the-flowchart) instructions 

##### Q3. Why do .md files open in Preview by default in Jupyter
> A3. To allow for instructions to be loaded in Scratchpad workspaces, the `base-python/plugin.jupyterlab-settings` file has the setting specified to set this

##### Q4. My RStudio workspaces keep refreshing on their own
> Due to the limitaitons of RStudio, you can only keep one RStudio tab open at a time. See the [PL Issue](https://github.com/PrairieLearn/PrairieLearn/issues/10498) for further details

