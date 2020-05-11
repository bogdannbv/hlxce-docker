#!/bin/sh

sed -i "/DB_ADDR/s/'\([^']*\)'/\'${DB_HOST}\'/g" config.php
sed -i "/DB_NAME/s/'\([^']*\)'/\'${DB_DATABASE}\'/g" config.php
sed -i "/DB_USER/s/'\([^']*\)'/\'${DB_USERNAME}\'/g" config.php
sed -i "/DB_PASS/s/'\([^']*\)'/\'${DB_PASSWORD}\'/g" config.php

exec "$@"