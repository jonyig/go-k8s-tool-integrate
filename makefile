APP=app
dlv-cmd=--listen=:2345 --headless=true --api-version=2 --accept-multiclient

run:
	go build -o ./bin/app .
	./bin/app
dlv:
	 go build -o ./bin/$(APP) -gcflags "-N -l"
	/Users/jonny/go/bin/dlv $(dlv-cmd) exec ./bin/$(APP)
skaffold-run:
	skaffold run -f devops/skaffold.yaml
skaffold-delete:
	skaffold delete -f devops/skaffold.yaml

s-reset: skaffold-delete skaffold-run
skaffold-dev-run:
	skaffold run -f devops/dev.skaffold.yaml
skaffold-dev-delete:
	skaffold delete -f devops/dev.skaffold.yaml

t-list:
	telepresence list

t-intercept:
	telepresence intercept test-deployment-app-jonny --port=8002:8001

t-leave:
	telepresence leave test-deployment-app-jonny