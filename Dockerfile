# x86_64 Linux build environment for PSI (code needs AES-NI/SSE intrinsics and gcc-7)
FROM --platform=linux/amd64 ubuntu:18.04
RUN apt-get update && apt-get install -y --no-install-recommends \
      g++ make libgmp-dev libglib2.0-dev libssl-dev pkg-config python3 tcpdump \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /psi
