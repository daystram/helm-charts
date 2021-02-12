#!/bin/sh
REPO="https://charts.daystram.com"
APPLICATION_NAME=$1

if [ -d ".daystram/helm-chart" ]; then
    echo -n "Helm chart already initialized at .daystram/helm-chart.";
    exit 1
fi

if [ -z "$APPLICATION_NAME" ]; then
    echo "Usage: curl -sfL $REPO/init.sh | sh -s - [application name]"
    exit 1
fi

if echo "$APPLICATION_NAME" | grep -q " "; then
    echo "Invalid application name! Name must not contain spaces."
    exit 1
fi

echo "Creating Helm chart for $1..."

curl -s "$REPO/scaffold.tgz" -o scaffold.tgz
tar -xzf scaffold.tgz
rm scaffold.tgz

find .daystram/helm-chart -type f -print0 | xargs -0 sed -i "s/APPLICATION_NAME/$APPLICATION_NAME/g"

echo "Chart succesfully created at .daystram/helm-chart"
exit 0
