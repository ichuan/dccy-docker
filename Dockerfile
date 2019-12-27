FROM ubuntu:16.04
EXPOSE 8870
RUN mkdir -p /opt
WORKDIR /opt
RUN apt update && apt install -y unzip curl sudo libusb-1.0-0-dev libicu-dev
RUN curl -fsSL https://github.com/DCCY-Group/DCCY-Deploy/archive/master.tar.gz | tar --strip-components 1 -xzf -
RUN cd /opt/install && sh installer-sakra.sh
RUN chmod +x /opt/install/dccy/node.js

# history plugin
COPY ./enable_history.js /opt/install/dccy/
RUN sed -ie 's/fibos.start()/require(".\/enable_history")(fibos)/g' /opt/install/dccy/node.js


WORKDIR /opt/install/dccy
ENTRYPOINT /opt/install/dccy/node.js
