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
ENV PYTHONSTARTUP=/pythonstartup.py

USER root
# Install dependencies and various libraries
RUN apt-get update && apt-get -y upgrade
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Suppress the opt-in dialog for announcements.  
# https://stackoverflow.com/questions/75511508/how-to-stop-this-message-would-you-like-to-receive-official-jupyter-news
RUN jupyter labextension disable @jupyterlab/apputils-extension:announcements
RUN mamba install --yes \
    'altair-all==5.4.1' \
    'vegafusion==1.6.9' \
    'vega_datasets' \
    'python>=3.11,<3.13' \
    'pip' \
    'ipykernel' \
    'nb_conda_kernels' \
    'otter-grader=6.*' \
    'scipy' \
    'matplotlib>=3.2.2' \
    'scikit-learn' \
    'requests>=2.24.0' \
    'graphviz' \
    'python-graphviz' \
    'eli5' \
    'shap' \
    'jinja2' \
    'lightgbm' \
    'spacy' \
    'xgboost' \
    'catboost' \
    'nltk' \
    'imbalanced-learn' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

RUN python -m pip install mglearn spacymoji "altair_ally>=0.1.1"


# This seems to be needed for Jupyterlab to get the anywidget extension installed
# although the package is technically already installed as part of altair-all.
# This package is needed to show altair charts offline, such as in CBTF.
# Each notebook need to start with `alt.renderers.enable('jupyter', offline=True)`
RUN python -m pip install anywidget
RUN pip3 cache purge

COPY jupyter_server_config.py /etc/jupyter/
#COPY plugin.jupyterlab-settings /etc/jupyter/
COPY ipython_config.py /etc/ipython/

RUN sed -i 's/"default": 120/"default": 1/' /opt/conda/share/jupyter/lab/schemas/@jupyterlab/docmanager-extension/plugin.json
RUN sed -i 's/"default": 120/"default": 1/' /opt/conda/lib/python3.11/site-packages/jupyterlab/schemas/@jupyterlab/docmanager-extension/plugin.json


EXPOSE 8080

USER jovyan
COPY pythonstartup.py /
CMD ["start.sh", "jupyter", "lab"]
