docker-tag := "ghcr.io/bhaan/postgres-flextended"
image-version := `cat postgres-flextended.version | xargs`
fly-version := `fly version | cut -d' ' -f2`

default: build

build:
  docker build --platform linux/amd64 --build-arg VERSION={{fly-version}} --tag {{docker-tag}}:latest --tag {{docker-tag}}:{{image-version}} .

push:
  docker push {{docker-tag}}:latest
  docker push {{docker-tag}}:{{image-version}}
  echo {{image-version}} | perl -pe 's/^((\d+\.)*)(\d+)(.*)$/$1.($3+1).$4/e' > postgres-flextended.version