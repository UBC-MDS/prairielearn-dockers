# This is the temporary location until it is moved to our repo or the PL repo
# force rebuild
FROM zacwarham/eric-gittu-zac:eight

USER root

COPY database/ /sql-scripts/

RUN mv /pgdata/postgresql.conf / && \
    rm -rf /pgdata/*

RUN /bin/bash /install-pg.sh
RUN chmod 755 /sbin/dockerentrypoint.sh

RUN mv /postgresql.conf /pgdata/

USER postgres
WORKDIR /

# Expose the pgadmin port
EXPOSE 5050

CMD ["pl-gosu-helper.sh", "/sbin/dockerentrypoint.sh"]