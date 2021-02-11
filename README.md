# :ship: daystram Chart Repository

Helm chart repository for daystram's applications.

## Initialize Chart

You can use the init script to initialize a Helm chart in your repository. This chart will be used by the CI pipeline worker to package and publish the chart to this repository.

Simply run the following:

```shell
$ curl -sfL https://charts.daystram.com/init.sh | sh - [application name]
```

## Updating Template

A starter scaffold chart can be found in `.daystram/chart`. This scaffold is retrieved by the [init.sh](./init.sh) script to ease chart initialization in new repositories without having to have Helm installed on the development machine.

To update this template, use the following:

```shell
$ cd .daystram
$ helm create APPLICATION_NAME
$ mv APPLICATION_NAME helm-chart
$ # make necessary updates
$ cd ..
$ tar -czf scaffold.tgz .daystram/helm-chart
$ mv scaffold.tgz docs/
```

Ensure that the application name to be replaced by [init.sh](./init.sh) is set to `APPLICATION_NAME`.
