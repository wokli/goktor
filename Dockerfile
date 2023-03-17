FROM golang:alpine AS builder
WORKDIR /build
ADD go.mod .
ADD go.sum .
COPY main.go main.go
RUN go build -o goktor main.go

FROM alpine
WORKDIR /app
COPY --from=builder /build/goktor /app/goktor
CMD ["/app/goktor"]