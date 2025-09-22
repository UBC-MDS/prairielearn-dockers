# Use the base image provided by MDS
FROM ubcmds/base-python:407cb8d

# Switch to root to install packages
USER root

# Define additional packages that are specific to this course
ENV PYTHON_PACKAGES="nycflights13"

# Install the pre-defined Python packages
RUN pip install --no-cache-dir $PYTHON_PACKAGES

# Switch to jovyan to launch Jupyter
USER jovyan

# End course image
