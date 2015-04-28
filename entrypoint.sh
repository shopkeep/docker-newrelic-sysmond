#!/bin/bash
set -e


if [ -n "$NEW_RELIC_LICENSE_KEY" ]; then 
	nrsysmond-config -c ${NEW_RELIC_SYSMOND_CONFIG:-/etc/newrelic/nrsysmond.cfg} --set license_key=$NEW_RELIC_LICENSE_KEY
fi

if [ -n "$NEW_RELIC_SYSMOND_LOGLEVEL" ]; then 
	nrsysmond-config -c ${NEW_RELIC_SYSMOND_CONFIG:-/etc/newrelic/nrsysmond.cfg} --set loglevel=$NEW_RELIC_SYSMOND_LOGLEVEL
fi

exec "$@"