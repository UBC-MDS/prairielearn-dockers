# Use the prairielearn r autograder
FROM ubcmds/base-r:d47f9cb

# Define additional packages that are specific to this course
ENV R_PACKAGES="infer palmerpenguins faraway"

# Install the pre-defined R packages
RUN install2.r -e $R_PACKAGES

# End course image