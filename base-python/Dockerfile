# Use the prairielearn modified version of jupyter lab
FROM prairielearn/workspace-jupyterlab-python:053e561ec8c268097e844a030ebbadb7afc276ec

# root required to install for ubuntu commands
USER root

# Install additional system dependencies if needed
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# jovyan is the default user for jupyter lab
USER jovyan

# Define additional packages not included in Python that are required for all courses
# eg.
# ENV PYTHON_PACKAGES="scipy numpy pandas matplotlib"

# Install the pre-defined Python packages
# eg.
# RUN pip install --no-cache-dir $PYTHON_PACKAGES

# Set auto-save interval
RUN sed -i '/"autosaveInterval": {/,/}/ s/"default": [0-9]*/"default": 1/' /opt/conda/share/jupyter/lab/schemas/@jupyterlab/docmanager-extension/plugin.json
RUN sed -i '/"autosaveInterval": {/,/}/ s/"default": [0-9]*/"default": 1/' /opt/conda/lib/python3.11/site-packages/jupyterlab/schemas/@jupyterlab/docmanager-extension/plugin.json

# Set default viewer for instructions
RUN sed -i '/"defaultViewers": {/,/}/ s/"default": {[^}]*}/"default": {"markdown": "Markdown Preview"}/' /opt/conda/share/jupyter/lab/schemas/@jupyterlab/docmanager-extension/plugin.json
RUN sed -i '/"defaultViewers": {/,/}/ s/"default": {[^}]*}/"default": {"markdown": "Markdown Preview"}/' /opt/conda/lib/python3.11/site-packages/jupyterlab/schemas/@jupyterlab/docmanager-extension/plugin.json

# Disable jedi for autocomplete
COPY ipython_config.py /etc/ipython/
