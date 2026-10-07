import os
import secrets

# Caddy listens on :8080 and proxies to the hub on localhost:8000. WORKSPACE_BASE_URL
# (e.g. /workspace/) is the URL prefix the app is published under.
_base = os.environ.get("WORKSPACE_BASE_URL", "").rstrip("/")
c.JupyterHub.bind_url = f"http://127.0.0.1:8000{_base}/"
c.JupyterHub.spawner_class = "jupyterhub.spawner.SimpleLocalProcessSpawner"
c.SimpleLocalProcessSpawner.home_dir_template = "/home/jovyan"

# Land straight in Positron. positron-server rejects requests without its
# connection token (Forbidden), so mint one per session, hand it to the session
# via POSITRON_CONNECTION_TOKEN (read by jupyter-positron-server) and put it in
# the landing URL, as the launcher tile does.
def _positron_pre_spawn(spawner):
    token = os.environ.get("POSITRON_CONNECTION_TOKEN") or secrets.token_hex(16)
    spawner.environment["POSITRON_CONNECTION_TOKEN"] = token
    spawner.default_url = f"/positron/?tkn={token}"

# Token Caddy uses to reach jovyan's server (see entrypoint.sh).
if os.environ.get("CADDY_HUB_TOKEN"):
    c.JupyterHub.services = [{"name": "caddy", "api_token": os.environ["CADDY_HUB_TOKEN"]}]
    c.JupyterHub.load_roles = [{
        "name": "caddy",
        "services": ["caddy"],
        "scopes": ["access:servers", "admin:servers", "admin:users", "read:users", "servers"],
    }]

c.Spawner.pre_spawn_hook = _positron_pre_spawn
c.Spawner.http_timeout = 120
c.Spawner.start_timeout = 120

# NO LOGIN, SINGLE USER: every visitor is silently signed in as "jovyan" and
# sent straight to Positron, working in /home/jovyan
from jupyterhub.auth import Authenticator
from jupyterhub.handlers import BaseHandler
from jupyterhub.utils import url_path_join


class AutoLoginHandler(BaseHandler):
    async def get(self):
        user = self.current_user
        if user is None:
            user = await self.login_user({"username": "jovyan"})
        self.redirect(self.get_next_url(user))


class AutoLoginAuthenticator(Authenticator):
    auto_login = True
    allow_all = True

    def login_url(self, base_url):
        return url_path_join(base_url, "autologin")

    def get_handlers(self, app):
        return [(r"/autologin", AutoLoginHandler)]

    async def authenticate(self, handler, data):
        return data["username"]


c.JupyterHub.authenticator_class = AutoLoginAuthenticator
