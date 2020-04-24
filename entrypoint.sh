#! /bin/sh
/nvidiagpubeat --strict.perms=false -c /nvidiagpubeat.yml -e -d "*" -E seccomp.enabled=false