FROM nvidia/cuda:9.0-base

COPY ./nvidiagpubeat.yml usr/bin/nvidiagpubeat.yml
COPY ./entrypoint.sh usr/bin/entrypoint.sh
COPY ./nvidiagpubeat usr/bin/nvidiagpubeat

RUN chmod 777 usr/bin/nvidiagpubeat && chmod 777 usr/bin/entrypoint.sh && chmod go-w usr/bin/nvidiagpubeat.yml

CMD ["usr/bin/entrypoint.sh"]