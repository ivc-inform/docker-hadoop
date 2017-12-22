FROM ivcinform/hadoop-base:1.2.1-hadoop3.0.0-java8
MAINTAINER Andrey.Yudin <info@ivc-inform.ru>

HEALTHCHECK CMD curl -f http://localhost:8042/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8042

CMD ["/run.sh"]
