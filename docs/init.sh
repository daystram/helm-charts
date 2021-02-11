#!/bin/sh
REPO="https://charts.daystram.com"

if [ -z $1 ]; then
    echo "Usage: curl -sfL $REPO/init.sh | sh - [application name]";
    exit
fi

if [ -d ".daystram/helm-chart" ]; then
    echo -n "Helm chart already initialized at .daystram/helm-chart, overwrite? [y/N] ";
    read resp;
    if [ "$resp" = "${resp#[Yy]}" ]; then
        exit
    fi
fi

echo "Creating Helm chart for $1..."

curl -s "$REPO/scaffold.tgz" -o scaffold.tgz
tar -xzf scaffold.tgz
rm scaffold.tgz

find .daystram/helm-chart -type f -print0 | xargs -0 sed -i "s/APPLICATION_NAME/$1/g"

echo "Chart succesfully created at .daystram/helm-chart"
