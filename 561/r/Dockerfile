# Use the prairielearn r autograder
FROM ubcmds/base-r:73a7f135654c71cf29c427611e6f4bcb9c8f77d6

# Define additional packages that are specific to this course
ENV R_PACKAGES="infer palmerpenguins broom GGally rsample ISLR leaps"

# Install the pre-defined R packages
RUN install2.r -e $R_PACKAGES

# End course image