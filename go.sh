#!/usr/bin/env bash
rm -rf ./bin
go build -o ./bin/app main.go
./bin/app
