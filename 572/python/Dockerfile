# Use the base image provided by MDS
FROM ubcmds/base-python:dd7ebe7

# Define additional packages that are specific to this course
ENV PYTHON_PACKAGES="scipy"

# Install the pre-defined Python packages
RUN pip install --no-cache-dir $PYTHON_PACKAGES

# Fix permisions (needed until https://github.com/PrairieLearn/PrairieLearn/pull/9831 is merged)
USER root
RUN chown -R 1001:1001 /tmp/jupyter_config
USER 1001

# End course image