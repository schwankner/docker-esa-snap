FROM debian:latest

RUN apt-get update

RUN apt-get -y install wget

RUN wget http://step.esa.int/downloads/6.0/installers/esa-snap_sentinel_unix_6_0.sh

RUN chmod a+x esa-snap_sentinel_unix_6_0.sh

RUN ./esa-snap_sentinel_unix_6_0.sh -q

RUN ln -s /usr/local/snap/bin/gpt /usr/bin/gpt