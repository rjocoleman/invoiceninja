#!/bin/bash

# this script is intended to be called from .bashrc
# This is a workaround for not having something like supervisord

if [ ! -e /var/run/redis/gitpod-init.lock ]; then
	touch /var/run/redis/gitpod-init.lock

	# launch database, if not running
	[ ! -e /var/run/redis/redis.pid ] && redis-server /etc/redis/redis.conf

	rm /var/run/redis/gitpod-init.lock
fi
