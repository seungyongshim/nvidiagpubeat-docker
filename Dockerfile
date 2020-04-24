FROM amd64/alpine

COPY ./nvidiagpubeat.yml /
COPY ./nvidiagpubeat /
COPY ./entrypoint.sh /

CMD ["/entrypoint.sh"]