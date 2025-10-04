FROM prairielearn/workspace-jupyterlab-r:2ad06f29fd46a734f8c5aa8267a26a94b3a36bb1

USER root

# For 531 we do not actually want to hide it like it is in PL
RUN echo 'c.KernelSpecManager.allowed_kernelspecs = {"python3", "ir"}' >> /etc/jupyter/jupyter_server_config.py

# Update before installing packages
RUN apt-get update && apt-get -y upgrade
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Suppress the opt-in dialog for announcements.  
# https://stackoverflow.com/questions/75511508/how-to-stop-this-message-would-you-like-to-receive-official-jupyter-news
RUN jupyter labextension disable @jupyterlab/apputils-extension:announcements

# Install dependencies and various libraries
RUN mamba install --yes \
    'altair-all' \
    'vega_datasets' \
    'otter-grader' \
    'r-essentials' \
    'r-devtools' \
    'r-gert' \
    'r-usethis' \
    'r-testthat' \
    'r-startup' \
    'r-rmarkdown' \
    'r-stringi' \
    'r-tidyverse' \
    'r-hmisc' \
    'r-rjson' \
    'r-ggally' \
    'r-ggthemes' \
    'r-cowplot' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# This seems to be needed for Jupyterlab to get the anywidget extension installed
# although the package is technically already installed as part of altair-all.
# This package is needed to show altair charts offline, such as in CBTF.
# Each notebook need to start with `alt.renderers.enable('jupyter', offline=True)`
RUN python -m pip install anywidget
RUN pip3 cache purge

USER jovyan
