# Use the base image provided by MDS
FROM ubcmds/base-r:1fb7bd8

# Define additional packages that are specific to this course
ENV R_PACKAGES="msme MASS lattice sandwich COUNT glm2"

# Install the pre-defined R packages
RUN install2.r -e $R_PACKAGES

# Install quantreg 5.98
RUN R -e "install.packages('https://cran.r-project.org/src/contrib/Archive/quantreg/quantreg_5.98.tar.gz', repos=NULL, type='source')"

# End course image