GOC := go

lint:
	$(GOC) vet
	docker run -t --rm -v $(shell pwd):/app -v ~/.cache/golangci-lint/:/root/.cache -w /app golangci/golangci-lint golangci-lint run -v

test:
	$(GOC) test -coverprofile=.coverage -trace=.trace
	$(GOC) tool cover -html=.coverage -o coverage.html
	$(GOC) tool trace .trace

run:
	$(GOC) run main.go
