DIR := ${CURDIR}

docker.build:
	docker build -t fibos-node:v5.0.3.0 .;

docker.run.node:
	docker run -d --name node-0 --restart=always -v ${DIR}/../node_data/node_0:/node -v ${DIR}/./resources:/app/resources \
		-p 8870:8870 -p 9870:9870 --env-file ./resources/env.list \
		fibos-node:v5.0.3.0 node;

docker.run.sync:
	docker run -d --name node-sync --restart=always -v ${DIR}/../new_node/data:/node/data -v ${DIR}/./resources:/app/resources \
		-p 8870:8870 -p 9870:9870 --env-file ./resources/sync.list \
		fibos-node:v5.0.3.0 node;

docker.run.wallet:
	docker run -d --name node-wallet --restart=always -v ${DIR}/../new_node/data:/node/data -v ${DIR}/./resources:/app/resources \
		-p 8870:8870 -p 9870:9870 --env-file ./resources/wallet.list \
		fibos-node:v5.0.3.0 node;

docker.run.remove:
	docker stop node-0 && docker rm node-0;

docker.run.removesync:
	docker stop node-sync && docker rm node-sync;

docker.run.removewallet:
	docker stop node-wallet && docker rm node-wallet;