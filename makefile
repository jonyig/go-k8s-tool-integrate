APP=app
dlv=--listen=:2345 --headless=true --api-version=2 --accept-multiclient

dlv:
	 go build -o ./bin/$(APP) -gcflags "all=-N -l"
	/Users/jonny/go/bin/dlv $(dlv) exec ./bin/$(APP)
skaffold-run:
	skaffold run -f devops/skaffold.yaml
skaffold-delete:
	skaffold delete -f devops/skaffold.yaml
skaffold-dev-run:
	skaffold run -f devops/dev.skaffold.yaml
skaffold-dev-delete:
	skaffold delete -f devops/dev.skaffold.yaml
