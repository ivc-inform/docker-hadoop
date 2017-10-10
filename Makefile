DOCKER_NETWORK = hadoop
ENV_FILE = ./hadoop.env

wordcount:
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} --restart on-failure:5 ivcinform/hadoop-base:1.2.1-hadoop2.8-java8 hdfs dfs -mkdir -p /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} --restart on-failure:5 ivcinform/hadoop-base:1.2.1-hadoop2.8-java8 hdfs dfs -copyFromLocal /opt/hadoop-2.8.1/README.txt /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} --restart on-failure:5 ivcinform/hadoop-wordcount
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} --restart on-failure:5 ivcinform/hadoop-base:1.2.1-hadoop2.8-java8 hdfs dfs -cat /output/*
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} --restart on-failure:5 ivcinform/hadoop-base:1.2.1-hadoop2.8-java8 hdfs dfs -rm -r /output
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} --restart on-failure:5 ivcinform/hadoop-base:1.2.1-hadoop2.8-java8 hdfs dfs -rm -r /input

build-local:
 docker build --no-cache -t ivcinform/hadoop-wordcount ./submit
	docker build --no-cache -t ivcinform/hadoop-base:1.2.1-hadoop2.8-java8 ./base
	docker build --no-cache -t ivcinform/hadoop-namenode:1.2.1-hadoop2.8-java8 ./namenode
	docker build --no-cache -t ivcinform/hadoop-datanode:1.2.1-hadoop2.8-java8 ./datanode
	docker build --no-cache -t ivcinform/hadoop-nodemanager:1.2.1-hadoop2.8-java8 ./nodemanager
	docker build --no-cache -t ivcinform/hadoop-resourcemanager:1.2.1-hadoop2.8-java8 ./resourcemanager
	docker build --no-cache -t ivcinform/hadoop-historyserver:1.2.1-hadoop2.8-java8 ./historyserver
