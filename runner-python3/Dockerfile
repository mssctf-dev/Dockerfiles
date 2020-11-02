FROM mssctf/base-container

RUN apk add --no-cache python3

USER root

COPY entrypoint.sh /opt/entrypoint.sh
ENTRYPOINT ["/opt/entrypoint.sh"]
