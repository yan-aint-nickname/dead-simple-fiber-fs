FROM golang:1.20.3-alpine3.17

WORKDIR /app

COPY main.go main.go
COPY go.mod go.mod
COPY go.sum go.sum

RUN go build

CMD ["sh", "-c", "./dead-simple-fiber-fs"]
