# Use the base image provided by MDS
FROM ubcmds/base-r:891b93d

# Define additional packages that are specific to this course
ENV R_PACKAGES="broom pwr MASS qqman dplyr"

# Install the pre-defined R packages
RUN install2.r -e $R_PACKAGES

# End course image