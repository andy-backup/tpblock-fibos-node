# fibos-node

## docker 构建

```bash
docker build -t fibos-node:v5.0.1.0 .
```

## docker 运行

1. 环境变量:

* P2P_PEER_ADDRESS P2P 地址, 多地址使用「,」相连, 如果不设置默认使用镜像内部的 `./resources/p2p.json`
* PRODUCER_ACCOUNT BP 账户名
* PRODUCER_PUBLIC_KEY BP 公钥
* PRODUCER_PRIVATE_KEY BP 私钥
* HTTP_PORT 节点 http rpc 端口, 如果不设置容器内部默认使用 8870 端口.
* P2P_PORT 节点 p2p 端口, 如果不设置容器内部默认使用 9870 端口.
* NODE_DIR 容器内节点数据存储的位置.
* GENESIS_PATH genensis.json 的位置

## 注意事项

* 如果设置同步节点, 不用设置 PRODUCER_ACCOUNT & PRODUCER_PUBLIC_KEY & PRODUCER_PRIVATE_KEY 参数. 否则共识节点需设置这些参数.

## 关于 BP 注册参考文档

https://dev.fo/zh-cn/guide/node-nodesnet#%E4%BD%BF%E7%94%A8-Producer-%E8%BA%AB%E4%BB%BD%E5%8F%91%E8%B5%B7%E6%B3%A8%E5%86%8C%E7%94%B3%E8%AF%B7