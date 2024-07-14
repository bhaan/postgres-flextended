# postgres-flextended

This repo is an actively maintained fork of [fly-apps/postgres-flex](https://github.com/fly-apps/postgres-flex) that includes a generous collection of Postgres extensions.

## Included extensions

- [PostGIS](https://postgis.net/)
- [TimescaleDB](https://github.com/timescale/timescaledb)
- [pgvector](https://github.com/pgvector/pgvector)
- [pg_cron](https://github.com/citusdata/pg_cron)

## Deploy this on Fly.io

```bash
fly pg create --name <app-name> --image-ref ghcr.io/bhaan/postgres-flextended:latest
```

### Update your Fly.io app

```bash
fly deploy --app <app-name> --image ghcr.io/bhaan/postgres-flextended:latest
```

See Fly.io's [documentation](https://fly.io/docs/postgres/) for more details on managing your Postgres apps.
