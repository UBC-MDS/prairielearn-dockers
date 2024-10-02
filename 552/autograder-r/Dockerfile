# Use the prairielearn r autograder
FROM prairielearn/grader-r:latest

# Define additional packages that are specific to this course
ENV R_PACKAGES="tidyverse infer palmerpenguins"

# Install the pre-defined R packages
RUN install2.r -e $R_PACKAGES

# End course image