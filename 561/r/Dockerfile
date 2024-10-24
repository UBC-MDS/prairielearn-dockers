# Use the prairielearn r autograder
FROM ubcmds/base-r:a8ff64d

# Define additional packages that are specific to this course
ENV R_PACKAGES="infer palmerpenguins broom GGally rsample ISLR"

# Install the pre-defined R packages
RUN install2.r -e $R_PACKAGES

# End course image