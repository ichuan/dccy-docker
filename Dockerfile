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

# cleanup
RUN rm -rf /var/lib/apt/lists/* /opt/install/installer-sakra.sh /opt/install/doc/ /opt/install/start.gif


WORKDIR /opt/install/dccy
ENTRYPOINT /opt/install/dccy/node.js
