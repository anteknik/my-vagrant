#!/bin/bash

mongoimport --host localhost:27018 --db test \
  --collection zips < /vagrant/data/zips.json
