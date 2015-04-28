# orbweb/newrelic-sysmond

Run the New Relic server monitor daemon.

[See New Relic's Getting started](https://docs.newrelic.com/docs/server/new-relic-servers)

## Dockerfile

This Docker image is based on the official [debian:wheezy](https://index.docker.io/_/debian/) base image.

## Usage

* Set env var ```NEW_RELIC_LICENSE_KEY``` to your newrelic license key. [See here](https://docs.newrelic.com/docs/accounts-partnerships/accounts/account-setup/license-key)
* (Optional) Set hostname using ```-h HOSTNAME``` or using env var ```NEW_RELIC_SYSMOND_HOST```. 

```bash
docker run -d -e NEW_RELIC_LICENSE_KEY=YOUR_NEW_RELIC_LICENSE_KEY -h $(hostname) orbweb/newrelic-sysmond
```
