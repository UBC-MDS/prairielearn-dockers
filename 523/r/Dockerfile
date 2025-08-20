# Use the base image provided by MDS
FROM ubcmds/base-r:c43b2dc

# Define additional packages that are specific to this course
ENV R_PACKAGES="nycflights13 gapminder"

# Install the pre-defined R packages
RUN install2.r -e $R_PACKAGES

# End course image