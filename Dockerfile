# use debian as base image
FROM debian:latest

# get list of installable packets
RUN apt-get update

# install wget as download tool
RUN apt-get -y install wget

# download snap installer version 6.0
RUN wget http://step.esa.int/downloads/6.0/installers/esa-snap_sentinel_unix_6_0.sh

#change file execution rights for snap installer
RUN chmod a+x esa-snap_sentinel_unix_6_0.sh

# install snap with gpt
RUN ./esa-snap_sentinel_unix_6_0.sh -q

# link gpt so it can be used systemwide
RUN ln -s /usr/local/snap/bin/gpt /usr/bin/gpt

# set gpt max memory to 32GB
RUN sed -i -e 's/-Xmx1G/-Xmx32G/g' /usr/local/snap/bin/gpt.vmoptions
