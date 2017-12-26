

VERSION ?= 3.0.0
URL ?= "https://www-eu.apache.org/dist/hadoop/common/hadoop-3.0.0/hadoop-3.0.0.tar.gz"

build:
	echo $(URL) > hadoop/url
	docker build -t ivcinform/hadoop-runner:$(VERSION) runner
	docker tag ivcinform/hadoop-runner:$(VERSION) ivcinform/hadoop-runner:build
	docker build -t ivcinform/hadoop:$(VERSION) hadoop
	docker tag ivcinform/hadoop:$(VERSION) ivcinform/hadoop:build
	docker build -t ivcinform/hadoop-hdfs-namenode:$(VERSION) hdfs-namenode
	docker build -t ivcinform/hadoop-hdfs-datanode:$(VERSION) hdfs-datanode
	docker build -t ivcinform/hadoop-yarn-resourcemanager:$(VERSION) yarn-resourcemanager
	docker build -t ivcinform/hadoop-yarn-nodemanager:$(VERSION) yarn-nodemanager

deploy:
	docker push ivcinform/hadoop-runner:$(VERSION)
	docker push ivcinform/hadoop:$(VERSION)
	docker push ivcinform/hadoop-hdfs-namenode:$(VERSION)
	docker push ivcinform/hadoop-hdfs-datanode:$(VERSION)
	docker push ivcinform/hadoop-yarn-resourcemanager:$(VERSION)
	docker push ivcinform/hadoop-yarn-nodemanager:$(VERSION)

.PHONY: deploy build
