# shopkeep/newrelic-sysmond

Forked from [orbweb/newrelic-sysmond](https://registry.hub.docker.com/u/orbweb/newrelic-sysmond/)

Run the New Relic server monitor daemon.

[See New Relic's Getting started](https://docs.newrelic.com/docs/server/new-relic-servers)

## Dockerfile

This Docker image is based on the official [debian:wheezy](https://index.docker.io/_/debian/) base image.

## Usage

### Stand Alone Usage

* Set env var ```NEW_RELIC_LICENSE_KEY``` to your newrelic license key. [See here](https://docs.newrelic.com/docs/accounts-partnerships/accounts/account-setup/license-key)
* (Optional) Set hostname using ```-h HOSTNAME``` or using env var ```NEW_RELIC_SYSMOND_HOST```.

```bash
docker run -d -e HOSTNAME=$(hostname) -e NEW_RELIC_LICENSE_KEY=0000000000111111111122222222223333333333 -v /var/run/docker.sock:/var/run/docker.sock -v /proc:/proc -v /dev:/dev -v /sys:/sys --privileged shopkeep/newrelic-sysmond:beta
```

### With Fleet on CoreOS

If you're running CoreOS and Fleet, then you can use the [newrelic-docker.service](https://github.com/shopkeep/docker-newrelic-sysmond/blob/master/newrelic-docker.service) file to start monitoring your entire cluster.

First set your New Relic license key in etcd on CoreOS

```bash
etcdctl set /new_relic/license_key 0000000000111111111122222222223333333333
```

Then submit the job to your cluster

```bash
fleetctl start newrelic-docker.service
```

This will run one instance on every machine using the CoreOS internal IP as the hostname and the license key in etcd.
