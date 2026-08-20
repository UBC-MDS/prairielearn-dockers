FROM ubuntu:24.04

RUN groupadd -r postgres && useradd -r -g postgres -m -d /home/postgres postgres \
    && chown -R postgres:postgres /home/postgres

RUN apt-get update \
  && apt-get install -y debian-keyring debian-archive-keyring apt-transport-https curl \
  && curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg \
  && curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list \
  && apt-get update \
  && apt-get install -y caddy \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update \
  && apt-get install -y curl ca-certificates software-properties-common \
  && add-apt-repository -y ppa:deadsnakes/ppa \
  && rm -rf /var/lib/apt/lists/*
RUN install -d /usr/share/postgresql-common/pgdg
RUN curl -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc

# Create the repository configuration file:
RUN sh -c 'echo "deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt noble-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

RUN apt-get update \
  && apt-get install -y build-essential libpq-dev python3.14 python3.14-dev python3.14-venv sudo \
  && DEBIAN_FRONTEND=noninteractive apt-get -yq install postgresql-18 postgresql-client-18 postgresql-contrib-18 \
  && rm -rf /var/lib/apt/lists/* \
  && python3.14 -m ensurepip --upgrade \
  && python3.14 -m pip install --upgrade pip \
  && python3.14 -m pip install sqlparse==0.5.3 psycopg2==2.9.10 \
  # && python3 -m pip install rstr \
  && python3.14 -m pip install --ignore-installed pgadmin4==9.17 \
  && mkdir /sql-scripts \
  && mkdir -p /var/run/postgresql && chown -R postgres:postgres /var/run/postgresql \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY config_local.py servers.json pgpass /usr/local/lib/python3.14/dist-packages/pgadmin4/
COPY database/ /sql-scripts/

RUN chown postgres:postgres /usr/local/lib/python3.14/dist-packages/pgadmin4/pgpass \
  && chmod 600 /usr/local/lib/python3.14/dist-packages/pgadmin4/pgpass

COPY install.sh pl-gosu-helper.sh install-pg.sh pg-init.sh /
RUN /bin/bash /install.sh
RUN /bin/bash /install-pg.sh

COPY dockerentrypoint.sh /sbin/dockerentrypoint.sh
RUN chmod 755 /sbin/dockerentrypoint.sh
COPY Caddyfile /caddy/

# UNSAFE - for local debugging only
# COPY Caddyfile.test_https /caddy/
# COPY --chmod=0755 pl-unsafe-test.sh /caddy/

COPY postgresql.conf /pgdata

USER postgres
WORKDIR /

# Expose the pgadmin port
EXPOSE 5050

CMD ["pl-gosu-helper.sh", "/sbin/dockerentrypoint.sh"]
