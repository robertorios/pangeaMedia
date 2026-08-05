# pangeaMedia — Docker (second microservice)

## Goal

Run **Media** in a container on your Mac. MySQL stays on the host. Users may already be in Docker on **:3000**. Same pattern as `pangeaUsers/DOCKER.md`.

## Prerequisites

1. Docker Desktop running  
2. `pangeaMedia/.env` with `DB_USER`, `DB_PASS`, **same `JWT_SECRET_KEY` as Users**, and AWS vars for uploads  
3. MySQL has `pangea_media_development`  
4. Free port 3001 (stop host `rails server -p 3001`)  
5. SPA still uses `http://localhost:3001`

## Commands

```bash
cd pangeaMedia
docker compose up --build
# or detached:
docker compose up --build -d

docker compose logs -f
docker compose down
```

## Verify

```bash
curl -s -o /dev/null -w "%{http_code}\n" http://127.0.0.1:3001/up
# expect 200

# Logged-in SPA: gallery / Media GraphQL should load
```

## Hybrid stack (typical right now)

| Port | Process |
|------|---------|
| 3000 | Users — Docker (`pangea-users`) |
| 3001 | Media — Docker (`pangea-media`) |
| 3002 | Conversations — host rails (until containerized) |
| 3003 | Search API — host |
| 5173 | SPA — host |

## Files

| File | Role |
|------|------|
| `Dockerfile.dev` | Build image (Ruby + gems + app) |
| `docker-compose.yml` | Run on 3001, inject `.env`, DB via `host.docker.internal` |
| `config/database.yml` | Uses `DB_HOST` when set (Docker TCP) |

## Next

Containerize **pangeaConversations** on port 3002 (`USERS_SERVICE_URL=http://host.docker.internal:3000`).
