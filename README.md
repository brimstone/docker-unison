unison
======


Sync volumes between multiple docker hosts.

Use with something like:
```
version: "3"

services:
  unison:
    image: unison
    networks:
    - unison
    volumes:
    - home:/home
    environment:
    - DIR=/home
    - SERVICE=unison
    deploy:
      mode: global
      resources:
        limits:
          memory: 50M
        reservations:
          memory: 10M

volumes:
  home:

networks:
  unison:
    driver: overlay
    driver_opts:
      encrypted: "true"
```

Where:
- SERVICE is the name of the service
- DIR is the directory to keep in sync

