# Use the base image provided by MDS
FROM ubcmds/base-python:407cb8d

# Define additional packages that are specific to this course
ENV PYTHON_PACKAGES="scipy"

# Install the pre-defined Python packages
RUN pip install --no-cache-dir $PYTHON_PACKAGES

# End course image