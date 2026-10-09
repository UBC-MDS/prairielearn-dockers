# Heavily built with Claude and then modified by Zac Warham
ARG BASE_IMAGE=quay.io/jupyter/base-notebook:latest
FROM ${BASE_IMAGE}

ARG POSITRON_VERSION=2026.09.1-2
ARG POSITRON_ARCH=x64
ARG POSITRON_ACTIVATION_ARCH=x86_64
ARG POSITRON_SERVER_PKG="jupyter-positron-server>=0.0.5"

ENV POSITRON_SERVER_DIR=/opt/positron-server \
    POSITRON_ACTIVATION_ARCH=${POSITRON_ACTIVATION_ARCH}

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
      curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Positron Installation
RUN set -eux; \
    case "${POSITRON_ARCH}" in \
      x64)   cdn_arch=x86_64 ;; \
      arm64) cdn_arch=arm64 ;; \
      *)     cdn_arch="${POSITRON_ARCH}" ;; \
    esac; \
    mkdir -p "${POSITRON_SERVER_DIR}"; \
    curl -fL "https://cdn.posit.co/positron/releases/server/${cdn_arch}/positron-server-linux-${POSITRON_ARCH}-${POSITRON_VERSION}.tar.gz" \
      -o /tmp/positron-server.tar.gz; \
    tar -xzf /tmp/positron-server.tar.gz -C "${POSITRON_SERVER_DIR}" --strip-components=1; \
    rm -f /tmp/positron-server.tar.gz; \
    # Bootstrap .vsix for certain extensions are deleted to save on memory/restrict student access
    rm -f \
        "${POSITRON_SERVER_DIR}"/extensions/bootstrap/GitHub.vscode-pull-request-github-*.vsix \
        "${POSITRON_SERVER_DIR}"/extensions/bootstrap/posit.assistant-*.vsix \
        "${POSITRON_SERVER_DIR}"/extensions/bootstrap/posit.publisher-*.vsix \
        "${POSITRON_SERVER_DIR}"/extensions/bootstrap/posit.shiny-*.vsix \
        "${POSITRON_SERVER_DIR}"/extensions/bootstrap/meta.pyrefly-*.vsix \
        "${POSITRON_SERVER_DIR}"/extensions/bootstrap/posit.air-vscode-*.vsix \
        "${POSITRON_SERVER_DIR}"/extensions/bootstrap/quarto.quarto-*.vsix


# Configuration to control activation server with Caddy
RUN pip install --no-cache-dir "${POSITRON_SERVER_PKG}" && \
    jupyter server extension enable --sys-prefix jupyter_server_proxy && \
    mamba install -y -c conda-forge configurable-http-proxy && \
    mamba clean -afy && \
    mkdir -p /srv/jupyterhub /caddy && \
    chown -R jovyan "${POSITRON_SERVER_DIR}/resources/activation" /srv/jupyterhub /caddy && \
    chmod -R a+rwX "${POSITRON_SERVER_DIR}/resources/activation" /srv/jupyterhub /caddy

# Disable Workspace Trust (no "trust this folder?" prompt; consoles can start).
RUN sed -i 's#"\$@"$#--disable-workspace-trust "$@"#' "${POSITRON_SERVER_DIR}/bin/positron-server" && \
    grep -q -- '--disable-workspace-trust "\$@"' "${POSITRON_SERVER_DIR}/bin/positron-server"

# PrairieLearn runs the container as an arbitrary UID with no /etc/passwd entry,
# which breaks Positron kernels (uv_os_get_passwd ENOENT).
RUN chmod a+w /etc/passwd

ENV PATH="${POSITRON_SERVER_DIR}/bin:${PATH}"

# License must exist in `clientFilesQuestion` in this configuration
ENV POSITRON_LICENSE_SRC=/home/jovyan/.positron/license.lic

# AI modified code from Eric Huber's Caddy config from 513 Postgres image
COPY --from=caddy:2 /usr/bin/caddy /usr/local/bin/caddy
COPY --chown=jovyan --chmod=0644 Caddyfile /caddy/Caddyfile

# Additional config files
COPY --chmod=0755 entrypoint.sh /usr/local/bin/entrypoint.sh
COPY --chmod=0644 jupyterhub_config.py /srv/jupyterhub/jupyterhub_config.py

# Default Positron user settings (ai.enabled=false). PrairieLearn replaces
# /home/jovyan at runtime, so entrypoint.sh merges this into the user's
# settings.json on launch.
ENV POSITRON_DEFAULT_SETTINGS=/opt/positron-default-settings.json
COPY --chmod=0644 settings.json ${POSITRON_DEFAULT_SETTINGS}

USER ${NB_UID}
WORKDIR /srv/jupyterhub
EXPOSE 8080
CMD ["/usr/local/bin/entrypoint.sh"]
