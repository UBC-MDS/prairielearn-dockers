# Use the base image provided by MDS
FROM ubcmds/base-r:73a7f135654c71cf29c427611e6f4bcb9c8f77d6

# Define additional packages that are specific to this course
ENV R_PACKAGES="broom pwr MASS qqman dplyr"

# Install the pre-defined R packages
RUN install2.r -e $R_PACKAGES

# End course image