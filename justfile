image-name := "ghcr.io/bhaan/postgres-flextended"
image-15-version := `head pg15/Dockerfile | grep "ARG PG_VERSION=" | cut -d'=' -f2`
image-16-version := `head pg16/Dockerfile | grep "ARG PG_VERSION=" | cut -d'=' -f2`
fly-version := `fly version | cut -d' ' -f2`

default: build

build: build-15 build-16

build-15:
  docker build -f pg15/Dockerfile --platform linux/amd64 --build-arg VERSION={{fly-version}} --tag {{image-name}}:{{image-15-version}} --tag {{image-name}}:15 .

build-16:
  docker build -f pg16/Dockerfile --platform linux/amd64 --build-arg VERSION={{fly-version}} --tag {{image-name}}:{{image-16-version}} --tag {{image-name}}:16 --tag {{image-name}}:latest .

push:
  docker push {{image-name}}:{{image-15-version}}
  docker push {{image-name}}:15
  docker push {{image-name}}:{{image-16-version}}
  docker push {{image-name}}:16
  docker push {{image-name}}:latest
