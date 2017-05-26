FROM ubuntu:latest

MAINTAINER vt <vardants@gmail.com>

# Makes sure no dialogs are opened and that dpkg-reconfigure does not prompt for input
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get -y dist-upgrade
RUN apt-get -y install software-properties-common

# Install jdk-8
RUN \
	echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
	add-apt-repository -y ppa:webupd8team/java && \
	apt-get update && \
	apt-get install -y oracle-java8-installer && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer

# Add JAVA_HOME to env variables
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

CMD ["bash"]