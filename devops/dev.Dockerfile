FROM golang:1.19.5-alpine3.17 as build
WORKDIR /go/src
RUN go install github.com/go-delve/delve/cmd/dlv@latest
COPY . .
RUN CGO_ENABLED=0 go build -gcflags="all=-N -l" -o /app main.go

FROM golang:1.19.5-alpine3.17

COPY --from=build /app .

EXPOSE 8001 56268

COPY --from=build /go/bin/dlv .

ENV GOTRACEBACK=all

ENTRYPOINT ["./dlv","--listen=:2345", "--headless=true", "--api-version=2", "--accept-multiclient","exec","./app"]
