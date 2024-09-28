#!/bin/sh

[ ! -e /dev/cdrom ] && echo "[ERROR] /dev/cdrom not found. make sure to pass the CD device to /dev/cdrom." && exit 1

chown -R cdripper /dev/cdrom
exec runuser -u cdripper --  "$@"
