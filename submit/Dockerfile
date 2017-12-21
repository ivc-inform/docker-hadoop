FROM ivcinform/hadoop-base:1.2.1-hadoop2.9.0-java8
MAINTAINER Andrey.Yudin <info@ivc-inform.ru>

ENV JAR_FILEPATH="/opt/hadoop/applications/application.jar"
ENV CLASS_TO_RUN="my.main.Application"
ENV PARAMS=""

ADD submit.sh /submit.sh
RUN chmod a+x /submit.sh

CMD ["/submit.sh"]
