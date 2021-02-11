#!/bin/sh
REPO="https://charts.daystram.com"

if [ -d ".daystram/helm-chart" ]; then
    echo -n "Helm chart already initialized at .daystram/helm-chart, overwrite? [y/N] ";
    read resp;
    if [ "$resp" = "${resp#[Yy]}" ]; then
        exit 1
    fi
fi

echo -n "Application name: ";
read APPLICATION_NAME;
if [ -z "$APPLICATION_NAME" ]; then
    echo "You have to provide an application name!"
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
