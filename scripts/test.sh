#!/bin/bash

cd $(dirname $0)

export GOOS=""
export GOARCH=""

echo "Synchronizing dependencies..."
cd ../
govendor sync

cd restapi

echo "Running tests..."
if ! go test;then
  echo "Failed testing. Aborting."
  exit 1
fi
