#!/usr/bin/env bash

# Run redis
docker-compose up -d sentry-redis

sleep 10s

# Run postgres
docker-compose up -d sentry-postgres

sleep 10s

# Generate secret_key
secret_key=`docker-compose run --rm sentry config generate-secret-key`
echo ${secret_key}

# Configure the sentry.env ${SENTRY_SECRET_KEY}
cat env/sentry.sample | sed -e "s/\${SECRET_KEY}/${secret_key}/g" > env/sentry
cat env/sentry

# Configure superuser
docker-compose run --rm sentry sentry upgrade

# Run the rest services
docker-compose up -d sentry sentry-cron sentry-worker-1