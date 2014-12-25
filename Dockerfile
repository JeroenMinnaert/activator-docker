FROM java:7

MAINTAINER Jeroen Minnaert <jeroenminnaert@gmail.com>

ENV ACTIVATOR_VERSION 1.2.12

# Download and install Activator
RUN cd /opt && \
  wget http://downloads.typesafe.com/typesafe-activator/$ACTIVATOR_VERSION/typesafe-activator-$ACTIVATOR_VERSION.zip && \
  unzip typesafe-activator-$ACTIVATOR_VERSION.zip && \
  rm -f /opt/typesafe-activator-$ACTIVATOR_VERSION.zip && \
  mv /opt/activator-$ACTIVATOR_VERSION /opt/activator
  
# Create a working directory to run your app from
RUN mkdir /home/app
WORKDIR /home/app

# Expose port 8888 for Activator UI
EXPOSE 8888
# Expose port 9000 for the app under /home/app
EXPOSE 9000
 
# Default Entry Point
ENTRYPOINT ["/opt/activator/activator", "-Dhttp.address=0.0.0.0"]

# Default Command
CMD ["ui"]