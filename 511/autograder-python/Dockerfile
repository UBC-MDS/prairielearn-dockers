# Use the prairielearn r autograder
FROM ubcmds/base-python-autograder:7c3a8ec

# Define additional packages not included in Python that are required for all courses
# eg.
ENV PYTHON_PACKAGES="nycflights13"

# Install the pre-defined Python packages
# eg.
RUN pip install --no-cache-dir $PYTHON_PACKAGES

# End course image