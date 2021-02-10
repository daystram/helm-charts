# daystram Chart Repository

Helm chart repository for daystram's applications.

## Updating Template

Chart template can be found in `.daystram/chart`. This template is used by the [init.sh](./init.sh) script to ease chart initialization in new repositories without having to have Helm installed on the development machine.

To update this template, use the following:

```shell
$ cd .daystram
$ helm create application
$ mv application helm-chart
```
