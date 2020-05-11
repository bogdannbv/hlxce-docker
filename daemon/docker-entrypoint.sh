#!/bin/bash

sed -i "/DBHost/s/\"\([^\"]*\)\"/\"${DB_HOST}\"/g" hlstats.conf
sed -i "/DBUsername/s/\"\([^\"]*\)\"/\"${DB_USERNAME}\"/g" hlstats.conf
sed -i "/DBPassword/s/\"\([^\"]*\)\"/\"${DB_PASSWORD}\"/g" hlstats.conf
sed -i "/DBName/s/\"\([^\"]*\)\"/\"${DB_DATABASE}\"/g" hlstats.conf

sed -i "/API_KEY=/s/\"\([^\"]*\)\"/\"${MAX_MIND_API_KEY}\"/g" GeoLiteCity/install_binary.sh

GeoLiteCity/install_binary.sh

exec "$@"