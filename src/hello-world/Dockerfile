FROM golang as builder

WORKDIR /app

COPY src/hello-world/main.go main.go

RUN go mod init hello-world
RUN CGO_ENABLED=0 go build

FROM alpine:3
RUN apk add --no-cache ca-certificates

COPY --from=builder /app/hello-world /hello-world

CMD ["/hello-world"]