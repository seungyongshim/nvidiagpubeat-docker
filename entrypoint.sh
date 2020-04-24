#! /bin/bash
/usr/bin/nvidiagpubeat -strict.perms=false -c /usr/bin/nvidiagpubeat.yml -e -d "*" -E seccomp.enabled=false