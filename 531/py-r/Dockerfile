FROM jupyter/minimal-notebook:2023-10-20

ENV XDG_DATA_HOME=/tmp/local/share
ENV XDG_CACHE_HOME=/tmp/cache
ENV XDG_CONFIG_HOME=/tmp/config
ENV JUPYTER_RUNTIME_DIR /tmp/runtime
ENV JUPYTER_ALLOW_INSECURE_WRITES true
ENV JUPYTER_CONFIG_DIR=/tmp/jupyter_config
ENV NPM_CONFIG_CACHE=/tmp/npm
ENV NO_UPDATE_NOTIFIER=true
ENV IPYTHONDIR=/tmp/ipython
ENV YARN_CACHE_FOLDER=/tmp/yarn_cache

USER root
# Install dependencies and various libraries
RUN apt-get update && apt-get -y upgrade
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Suppress the opt-in dialog for announcements.  
# https://stackoverflow.com/questions/75511508/how-to-stop-this-message-would-you-like-to-receive-official-jupyter-news
RUN jupyter labextension disable @jupyterlab/apputils-extension:announcements
RUN mamba install --yes \
    'altair-all' \
    'vega_datasets' \
    'otter-grader' \
    'r-base>=4.1' \
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
    'r-cowplot' \
    'r-irkernel' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# This seems to be needed for Jupyterlab to get the anywidget extension installed
# although the package is technically already installed as part of altair-all.
# This package is needed to show altair charts offline, such as in CBTF.
# Each notebook need to start with `alt.renderers.enable('jupyter', offline=True)`
RUN python -m pip install anywidget
RUN pip3 cache purge

COPY jupyter_server_config.py /etc/jupyter/

USER jovyan
CMD ["start.sh", "jupyter", "lab"]
