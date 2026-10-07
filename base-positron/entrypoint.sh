#!/bin/bash
set -e
export ADJUSTED_BASE_URL="${WORKSPACE_BASE_URL%%/}"
export POSITRON_CONNECTION_TOKEN="$(python3 -c 'import secrets; print(secrets.token_hex(16))')"
export CADDY_HUB_TOKEN="$(python3 -c 'import secrets; print(secrets.token_hex(32))')"
echo "ADJUSTED_BASE_URL is: ${ADJUSTED_BASE_URL}"

LIC_DIR="${POSITRON_SERVER_DIR}/resources/activation/linux/${POSITRON_ACTIVATION_ARCH}"
if [ -f "${POSITRON_LICENSE_SRC}" ]; then
  install -m 0644 "${POSITRON_LICENSE_SRC}" "${LIC_DIR}/license.lic"
else
  echo "WARNING: ${POSITRON_LICENSE_SRC} not found; Positron will be unlicensed" >&2
fi

HUB="http://localhost:8000${ADJUSTED_BASE_URL}"

jupyterhub -f /srv/jupyterhub/jupyterhub_config.py &
until curl -fs "${HUB}/hub/health" >/dev/null; do sleep 0.5; done

echo "[run] starting the jovyan Positron server"
curl -fs -X POST -H "Authorization: token ${CADDY_HUB_TOKEN}" "${HUB}/hub/api/users/jovyan" >/dev/null || true
curl -fs -X POST -H "Authorization: token ${CADDY_HUB_TOKEN}" "${HUB}/hub/api/users/jovyan/server" >/dev/null || true
until curl -fs -H "Authorization: token ${CADDY_HUB_TOKEN}" "${HUB}/hub/api/users/jovyan" | grep -q '"ready": *true'; do sleep 1; done

echo "[run] starting Caddy reverse proxy"
exec caddy run --config /caddy/Caddyfile
