# Use the prairielearn r autograder
FROM prairielearn/grader-r:latest

# Ensure all critical dependencies are up-to-date
RUN R -e "install.packages(c('rlang', 'vctrs', 'tidyselect', 'pillar', 'cli', 'lifecycle', 'glue', 'tibble', 'purrr', 'ellipsis', 'ISLR', 'leaps'), repos='https://cloud.r-project.org/')"

# Define additional packages that are specific to this course
ENV R_PACKAGES="tidyverse infer palmerpenguins broom GGally rsample"

# Install the pre-defined R packages
RUN install2.r -e $R_PACKAGES

# End course image