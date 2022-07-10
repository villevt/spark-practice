FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install default-jdk scala wget -y
RUN wget https://downloads.apache.org/spark/spark-3.3.0/spark-3.3.0-bin-hadoop3.tgz
RUN tar xvf spark-*
RUN mv spark-3.3.0-bin-hadoop3 /opt/spark

WORKDIR /opt/spark
ENV SPARK_HOME="/opt/spark"
ENV SPARK_NO_DAEMONIZE=true
ENV SPARK_MASTER_HOST="localhost"
CMD ["./sbin/start-master.sh"]
