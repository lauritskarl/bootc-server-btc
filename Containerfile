FROM ghcr.io/lauritskarl/bootc-server:latest
ADD etc etc
RUN dnf install -y \
  bitcoin-core-server \
  bitcoin-core-utils && \
  dnf clean all
RUN systemctl enable bitcoin.service
RUN bootc container lint
