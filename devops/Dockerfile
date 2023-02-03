FROM golang:1.19.5-alpine3.17 as build
WORKDIR /go/src
RUN go install github.com/go-delve/delve/cmd/dlv@latest

COPY .. .
RUN go build -o /app main.go

FROM golang:1.19.5-alpine3.17
COPY --from=build /app .
ENTRYPOINT ["./app"]
