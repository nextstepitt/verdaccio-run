#!/bin/bash

export VERDACCIO_STORAGE_PATH=$(pwd)/storage
npx verdaccio --config ./config.yaml