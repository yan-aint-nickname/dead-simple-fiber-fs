FROM golang:1.20.3-alpine3.17

WORKDIR /app

COPY . .

RUN go build

EXPOSE 3000

CMD ["sh", "-c", "./dead-simple-fiber-fs"]
