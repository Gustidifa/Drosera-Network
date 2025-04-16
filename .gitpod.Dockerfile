FROM gitpod/workspace-full

USER root

RUN apt-get update && \
    apt-get install -y \
    docker.io \
    lz4 \
    jq \
    libssl-dev \
    libgbm1 \
    libleveldb-dev \
    pkg-config \
    clang \
    build-essential \
    automake \
    autoconf \
    git \
    curl \
    tmux \
    unzip \
    ncdu \
    nano \
    htop

USER gitpod
