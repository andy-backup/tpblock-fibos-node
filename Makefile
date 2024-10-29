DIR := ${CURDIR}

docker.build:
	docker build -t fibos-node:v5.0.1.0 .;

docker.run.node:
	docker run -d --name node-0 -v ${DIR}/../node_data/node_0:/node -v ${DIR}/./resources:/app/resources \
		-p 8870:8870 -p 9870:9870 --net host --env-file ./resources/env.list \
		fibos-node:v5.0.1.0 node;

docker.run.nodea:
	docker run -d --name node-sync -v ${DIR}/../node_data/node_sync:/node -v ${DIR}/./resources:/app/resources \
		-p 8872:8872 -p 9872:9872 --net host --env-file ./resources/sync.list \
		fibos-node:v5.0.1.0 node;

docker.run.remove:
	docker stop node-0 && docker rm node-0;

docker.run.removesync:
	docker stop node-sync && docker rm node-sync;