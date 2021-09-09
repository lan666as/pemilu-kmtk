# Helios Election System

Helios is an end-to-end verifiable voting system.

[![Travis Build Status](https://travis-ci.org/benadida/helios-server.svg?branch=master)](https://travis-ci.org/benadida/helios-server)

[![Stories in Ready](https://badge.waffle.io/benadida/helios-server.png?label=ready&title=Ready)](https://waffle.io/benadida/helios-server)

# Usage
## Development

    docker-compose -f docker-compose.yml up --build

Then run this one-time command

    docker-compose -f docker-compose.yml exec web /bin/sh ./setup.dev.sh

## Production

    docker-compose -f docker-compose.prod.yml up --build

Then run this one-time command

    docker compose -f docker-compose.prod.yml exec web /bin/sh ./setup.prod.sh

# Referensi

[Tutorial](https://wrmack.github.io/helios-server-docs/site/)