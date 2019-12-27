# dccy-docker
Docker builds for dccy. API port exposed at 8870.


## Build

```
docker build -t dccy .
```

## Run

```
mkdir -p data
# watch account `abcwalletnet` for query actions
docker run --rm -itd --name dccy -e "WATCH_ACCOUNT=abcwalletnet" -p 8870:8870 -v `pwd`/data:/opt/install/dccy/dccy_node dccy
```

## Using pre-built docker image

Using automated build image from <https://hub.docker.com/r/mixhq/dccy/>:

```
docker run --rm -itd --name dccy -e "WATCH_ACCOUNT=abcwalletnet" -p 8870:8870 -v `pwd`/data:/opt/install/dccy/dccy_node mixhq/dccy
```
