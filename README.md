
# Munan Auth - Keycloak Authentication Service

This repository contains the configuration and deployment setup for a Keycloak authentication service using Docker Compose.

## Overview

- Keycloak server with PostgreSQL database
- Cloudflare tunnel integration
- GitHub Actions automated deployment
- Realm export/import functionality

## Prerequisites

- Docker and Docker Compose
- Cloudflare account and tunnel token
- SSH access to deployment server
- Environment variables setup

## Environment Variables

Create a `.env` file with the following variables:

```env
KEYCLOAK_USER=<admin_username>
KEYCLOAK_PASSWORD=<admin_password>
KEYCLOAK_URL=<your_keycloak_url>
POSTGRES_USER=<postgres_username>
POSTGRES_PASSWORD=<postgres_password>
CLOUDFLARE_TUNNEL_TOKEN=<your_cloudflare_tunnel_token>
```

## Installation & Deployment

1. Clone the repository:
```bash
git clone https://github.com/vakhoa4875/munan-auth.git
cd munan-auth
```

2. Start the services:
```bash
docker-compose up -d
```

## Realm Management

Export the current realm configuration:
```bash
./export-realm.sh
```

The realm configuration will be saved to `realm-export.json`

## Continuous Deployment

The repository includes GitHub Actions workflow for automatic deployment:
- Triggers on push to main branch
- Pulls latest changes on server
- Exports current realm configuration
- Rebuilds and restarts containers

## Components

- **Keycloak**: Authentication and authorization server (v24.0.1)
- **PostgreSQL**: Database backend (v15)
- **Cloudflared**: Cloudflare tunnel for secure access

## Network Architecture

- All services run on a dedicated `keycloak-network` bridge network
- Keycloak runs on port 8080
- PostgreSQL runs on port 5432
- Cloudflare tunnel provides secure external access

## Maintenance

To update the services:
```bash
docker-compose pull
docker-compose up -d
```

To view logs:
```bash
docker-compose logs -f
```
