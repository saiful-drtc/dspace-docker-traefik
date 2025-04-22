# DSpace with Traefik

This repository contains Docker Compose configurations for running DSpace with Traefik as the reverse proxy.

## Project Structure

- `docker-compose.yml` - Root configuration that sets up:
  - DSpace main application
  - PostgreSQL database
  - Solr search
  - Traefik reverse proxy
- `api/docker-compose.yml` - DSpace REST API service
- `ui/docker-compose.yml` - DSpace Angular UI
- `traefik/docker-compose.yml` - Traefik detailed configuration

## Quick Start

1. Create your `.env` file:
```bash
cp .env.example .env
```

2. Start the base services:
```bash
docker-compose up -d
```

3. Start the UI (optional):
```bash
docker-compose -f ui/docker-compose.yml up -d
```

4. Start the REST API (optional):
```bash
docker-compose -f api/docker-compose.yml up -d
```

## Configuration

- The root `docker-compose.yml` provides the core DSpace services
- Use `docker-compose.override.yml` for local customizations
- Environment variables are configured in `.env`

## Access Services

- DSpace UI: http://localhost
- REST API: http://localhost/server
- Traefik Dashboard: http://localhost:8080

## Create admin account:
```
cd cli
docker-compose run --rm dspace-cli create-administrator -e test@example.com -f admin -l user -p admin -c en
```
