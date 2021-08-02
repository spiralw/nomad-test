FROM alpine:latest

RUN apk add go

WORKDIR /build
COPY . /build/

RUN go build -o test .

ENTRYPOINT [ "/build/test" ]