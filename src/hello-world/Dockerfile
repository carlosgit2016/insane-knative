FROM golang as builder

ENV TARGET world

WORKDIR /app

COPY src/hello-world/main.go main.go

RUN go mod init hello-world
RUN go build

FROM alpine:3
RUN apk add --no-cache ca-certificates

COPY --from=builder /app/hello-world /hello-world

CMD ["/hello-world"]