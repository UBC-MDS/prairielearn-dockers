# Use the prairielearn modified version of rocker
FROM prairielearn/workspace-rstudio:e3eafc75bd2dc578113d8acc6c380aa9ddf21151

# root required to install rocker scripts - https://github.com/rocker-org/rocker-versioned2/tree/master/scripts
USER root

# Install rocker scripts that are required for all courses
RUN /bin/sh -c /rocker_scripts/install_tidyverse.sh

# rstudio is the default user for rocker based images
USER rstudio

# Define additional packages not included in rocker that are required for all courses
# e.g.
# ENV R_PACKAGES="nycflights13 gapminder palmerpenguins"

# Install the pre-defined R packages
# e.g. 
# RUN install2.r -e $R_PACKAGES

# Copy the custom rstudio-prefs.json file to the correct location to enable auto-save
COPY rstudio-prefs.json /home/rstudio/.config/rstudio/rstudio-prefs.json
