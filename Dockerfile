FROM java:7

MAINTAINER Jeroen Minnaert <jeroenminnaert@gmail.com>

ENV ACTIVATOR_VERSION 1.2.12

RUN cd /opt && \
  wget http://downloads.typesafe.com/typesafe-activator/$ACTIVATOR_VERSION/typesafe-activator-$ACTIVATOR_VERSION.zip && \
  unzip typesafe-activator-$ACTIVATOR_VERSION.zip && \
  rm -f /opt/typesafe-activator-$ACTIVATOR_VERSION.zip && \
  mv /opt/activator-$ACTIVATOR_VERSION /opt/activator
  
  
RUN mkdir /home/app
WORKDIR /home/app

# Expose ports.
EXPOSE 8888
EXPOSE 9000
 
ENTRYPOINT ["/opt/activator/activator", "-Dhttp.address=0.0.0.0"]

CMD ["ui"]