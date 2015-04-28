FROM        debian:wheezy

ENV         NEW_RELIC_SYSMOND_VERSION=2.0.3.113 \
            NEW_RELIC_LICENSE_KEY= \
            NEW_RELIC_SYSMOND_SSL=true \
            NEW_RELIC_SYSMOND_LOGFILE=/dev/stdout \
            NEW_RELIC_SYSMOND_LOGLEVEL=info

# apt-get update
RUN         apt-get update -q && \
            apt-get install -y ca-certificates curl && \
            echo deb http://apt.newrelic.com/debian/ newrelic non-free >> /etc/apt/sources.list.d/newrelic.list && \
            curl -L https://download.newrelic.com/548C16BF.gpg | apt-key add - && \
            apt-get update -q && \
            apt-get install -y newrelic-sysmond=$NEW_RELIC_SYSMOND_VERSION && \
            apt-get autoremove -y && \
            apt-get autoclean -y && \
            rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME      ["/etc/newrelic/"]
CMD         /usr/sbin/nrsysmond-config -c /etc/newrelic/nrsysmond.cfg --set \
                license_key=$NEW_RELIC_LICENSE_KEY \
                logfile=$NEW_RELIC_SYSMOND_LOGFILE \
                ssl=$NEW_RELIC_SYSMOND_SSL \
                loglevel=$NEW_RELIC_SYSMOND_LOGLEVEL && \
            /usr/sbin/nrsysmond -c /etc/newrelic/nrsysmond.cfg -f -n ${NEW_RELIC_SYSMOND_HOST:-$(hostname)}