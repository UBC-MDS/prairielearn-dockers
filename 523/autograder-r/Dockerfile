# Use the prairielearn r autograder
FROM ubcmds/base-r-autograder:7c3a8ec

# Ensure all critical dependencies are up-to-date
RUN R -e "install.packages(c('rlang', 'vctrs', 'tidyselect', 'pillar', 'cli', 'lifecycle', 'glue', 'tibble', 'purrr', 'ellipsis'), repos='https://cloud.r-project.org/')"

# Define additional packages that are specific to this course
ENV R_PACKAGES="nycflights13 gapminder"

# Install the pre-defined R packages
RUN install2.r -e $R_PACKAGES

# End course image