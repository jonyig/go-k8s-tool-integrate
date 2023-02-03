APP=app
dlv=--listen=:2345 --headless=true --api-version=2 --accept-multiclient

dlv:
	 go build -o ./bin/$(APP) -gcflags "all=-N -l"
	/Users/jonny/go/bin/dlv $(dlv) exec ./bin/$(APP)