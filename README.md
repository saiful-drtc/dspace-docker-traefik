# DSpace 7 in docker with traefik proxy
## Configure
Create from each env.sample file an .env file and set all variable to a valid hostname

## Start DSpace
#### Create required networks:
```
docker network create proxy
docker network create dspacenet
```

#### Start the containers:
```
cd traefik
./start.sh

cd api
./start.sh

cd ui
./start.sh
```

## Check it
With `https://api.example.com/server/` can check the backend.

With `https://ui.example.com/` can check the frontend.

## Create admin account:
```
cd cli
docker-compose run --rm dspace-cli create-administrator -e test@example.com -f admin -l user -p admin -c en
```
