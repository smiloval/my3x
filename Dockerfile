FROM ubuntu:22.04 AS builder

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
  git \
  build-essential \
  gcc \
  golang-1.23-go \
  ca-certificates
ENV PATH=$PATH:/usr/lib/go-1.23/bin
COPY . ./

ENV GOOS=linux
ENV GOARCH=amd64
ENV CGO_ENABLED=1
#ENV CGO_CFLAGS="-D_LARGEFILE64_SOURCE"

RUN echo "Building 3x-ui..."
RUN cd /3x-ui && go build -o x-ui main.go

RUN echo "Building Xray-core..."
RUN cd /Xray-core && \
    VERSION=$(git describe --always --dirty) && \
    go build -o xray-$GOOS-$GOARCH -trimpath -ldflags "-X github.com/xtls/xray-core/core.build=$VERSION -s -w -buildid=" ./main

FROM scratch
COPY --from=builder /3x-ui/x-ui /x-ui
COPY --from=builder /Xray-core/xray-* /