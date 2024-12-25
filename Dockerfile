FROM ubuntu:20.04
WORKDIR /app
# 更新和安装必要的软件包
RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl \
    sudo \
    htop \
    vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY . /app
RUN  sudo sh /app/installer.sh
ENTRYPOINT ["./entrypoint.sh"]
CMD ["chain"]
