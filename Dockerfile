FROM ubuntu:20.04
WORKDIR /app
RUN sed -i 's/archive.ubuntu.com/mirrors.huaweicloud.com/g' /etc/apt/sources.list && \ 
    apt-get update
RUN apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y curl sudo libusb-1.0 supervisor libssl-dev libcurl4-gnutls-dev \
    libpq-dev libpqxx-dev vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app
RUN  sudo sh /app/installer.sh
ENTRYPOINT ["./entrypoint.sh"]
CMD ["chain"]
