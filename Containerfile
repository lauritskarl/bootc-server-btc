FROM ghcr.io/lauritskarl/bootc-server:latest
ADD etc etc
RUN dnf install -y \
  bitcoin-core-server \
  bitcoin-core-utils && \
  dnf clean all
RUN systemctl enable bitcoin.service
RUN firewall-cmd --add-service=bitcoin --permanent
RUN firewall-cmd --add-port=8332/tcp --permanent
RUN bootc container lint
