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
make start

cd api
make start

cd ui
make start
```

## Check it
With `https://api.example.com/server/` can check the backend.
