# Hadoop Maven template

The Hadoop Maven template image serves as a base image to build your own Maven application to run on a Hadoop cluster. See [big-data-europe/docker-hadoop README](https://github.com/big-data-europe/docker-hadoop) for a description how to setup a Hadoop cluster.

### Package your application using Maven
You can build and launch your application on a Hadoop cluster by extending this image with your sources. The template uses [Maven](https://maven.apache.org/) as build tool, so make sure you have a `pom.xml` file for your application specifying all the dependencies.

The Maven `package` command must create an assembly JAR (or 'uber' JAR) containing your code and its dependencies. Hadoop dependencies should be listes as `provided`. The [Maven shade plugin](http://maven.apache.org/plugins/maven-shade-plugin/) provides a plugin to build such assembly JARs.

### Extending the Hadoop Maven template with your application

#### Steps to extend the Hadoop Maven template
1. Create a Dockerfile in the root folder of your project (which also contains a `pom.xml`)
2. Extend the Hadoop Maven template Docker image
3. Configure the following environment variables (unless the default value satisfies):
  * `JAR_NAME` (default: application)
  * `CLASS_TO_RUN` (default: my.main.Application)
  * `PARAMS` (default: "")

4. Build and run the image
```
docker build --rm=true -t bde/mapreduce-app .
docker run --name my-mapreduce-app --net hadoop -e ENABLE_INIT_DAEMON=false -d bde/mapreduce-app
```

The sources in the project folder will be automatically added to `/opt/hadoop/applications` if you directly extend the Hadoop Maven template image. Otherwise you will have to add and package the sources by yourself in your Dockerfile with the commands:

    COPY . /opt/hadoop/applications
    RUN cd /opt/hadoop/applications \
        && mvn clean package

If you overwrite the template's `CMD` in your Dockerfile, make sure to execute the `/template.sh` script at the end.

#### Example Dockerfile
```
FROM ivcinform/hadoop-maven-template:1.2.1-hadoop3.0.0-java8

MAINTAINER Andrey.Yudin <info@ivc-inform.ru>

ENV JAR_FILEPATH="my-app-1.0-SNAPSHOT-with-dependencies.jar"
ENV CLASS_TO_RUN="my.main.Application"
ENV PARAMS="arg1 arg2"
```

#### Example application
See [hadoop-starter](https://github.com/GezimSejdiu/hadoop-starter).
