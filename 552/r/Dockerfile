# Use the prairielearn r autograder
FROM ubcmds/base-r:c43b2dc

# Define additional packages that are specific to this course
ENV R_PACKAGES="infer palmerpenguins faraway"

# Install the pre-defined R packages
RUN install2.r -e $R_PACKAGES

# End course image