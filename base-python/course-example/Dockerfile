# Use the base image provided by MDS
FROM zacwarham/no-jedi:one

# Define additional packages that are specific to this course
ENV PYTHON_PACKAGES="scipy"

# Install the pre-defined Python packages
RUN pip install --no-cache-dir $PYTHON_PACKAGES

EXPOSE 8080
# End course image