#!/bin/sh
set -e
REPO="https://charts.daystram.com"
APPLICATION_NAME=$1
APPLICATION_VERSION=$2

if [ ! -d ".daystram/helm-chart" ]; then
    echo -n "Helm chart not found at .daystram/helm-chart.";
    exit 1
fi

if [ -z "$APPLICATION_NAME" ]; then
    echo "Usage: curl -sfL $REPO/build.sh | sh -s - [application name] [application version]"
    exit 1
fi

if [ -z "$APPLICATION_VERSION" ]; then
    echo "Usage: curl -sfL $REPO/build.sh | sh -s - [application name] [application version]"
    exit 1
fi

if echo "$APPLICATION_NAME" | grep -q " "; then
    echo "Invalid application name! Name must not contain spaces."
    exit 1
fi

echo "Packaging Helm chart..."

sed -i "s/APPLICATION_VERSION/$APPLICATION_VERSION/g" .daystram/helm-chart/Chart.yaml
helm package .daystram/helm-chart --version $APPLICATION_VERSION
helm repo index .

echo "Chart succesfully packaged!"
exit 0
