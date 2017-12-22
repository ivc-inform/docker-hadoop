DOCKER_NETWORK = hadoop
ENV_FILE = ./hadoop.env

build-local:
	docker build --no-cache -t ivcinform/hadoop-base:1.2.1-hadoop2.9.0-java8 ./base
	docker build --no-cache -t ivcinform/hadoop-namenode:1.2.1-hadoop2.9.0-java8 ./namenode
	docker build --no-cache -t ivcinform/hadoop-datanode:1.2.1-hadoop2.9.0-java8 ./datanode
	docker build --no-cache -t ivcinform/hadoop-nodemanager:1.2.1-hadoop2.9.0-java8 ./nodemanager
	docker build --no-cache -t ivcinform/hadoop-resourcemanager:1.2.1-hadoop2.9.0-java8 ./resourcemanager
	docker build --no-cache -t ivcinform/hadoop-historyserver:1.2.1-hadoop2.9.0-java8 ./historyserver

deploy:
	docker push ivcinform/hadoop-base:1.2.1-hadoop2.9.0-java8
 docker push ivcinform/hadoop-namenode:1.2.1-hadoop2.9.0-java8
 docker push ivcinform/hadoop-datanode:1.2.1-hadoop2.9.0-java8
 docker push ivcinform/hadoop-nodemanager:1.2.1-hadoop2.9.0-java8
 docker push ivcinform/hadoop-resourcemanager:1.2.1-hadoop2.9.0-java8
 docker push ivcinform/hadoop-historyserver:1.2.1-hadoop2.9.0-java8
