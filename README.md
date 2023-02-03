# go skaffold

## getting started

### start up k8s cluster using Docker for Mac / Windows

### install skaffold

```bash
brew reinstall skaffold
```

### use existing skaffold

see [skaffold.yaml](devops/skaffold.yaml) file:

```yaml
apiVersion: skaffold/v1beta17
kind: Config
metadata:
  name: go-skaffold
build:
  artifacts:
  - image: daggerok/go-skaffold
deploy:
  kubectl:
    manifests:
    - k8s-pod.yaml
```

### or initialize new one

```bash
skaffold init -f k8s-pod.yaml
```

you will need at least one k8s yaml file:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: go-skaffold
spec:
  containers:
    - name: go-skaffold
      image: daggerok/go-skaffold
```

### start develop!

```bash
skaffold dev
```

NOTE: skaffold will build `daggerok/go-slaffold` docker image and deploy it to local kubernetes cluster

## no skaffold: docker workflow

```bash
docker build -t daggerok/go-skaffold .
docker run -it --rm --name app daggerok/go-skaffold
```

you will need Dockerfile:

```Dockerfile
FROM golang:1.13.4-alpine3.10 as build
COPY main.go .
RUN go build -o /app main.go

FROM golang:1.13.4-alpine3.10
COPY --from=build /app .
ENTRYPOINT ["./app"]
```

## no skaffold: local workflow

```bash
rm -rf ./bin
go build -o ./bin/app main.go
./bin/app
```

## or simply ise shell scripting automation

```bash
./go.sh
```

you will need `go.sh` shell script for it:

```bash
#!/usr/bin/env bash
rm -rf ./bin
go build -o ./bin/app main.go
./bin/app
```

## links

* https://www.youtube.com/watch?v=tTNrzEjROCo
* https://www.youtube.com/watch?v=TYx0BTyFtmc
* https://gobyexample.com/
