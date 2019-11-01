# use debian as base image
FROM debian:latest

# get list of installable packets and install wget
RUN apt-get update && \
    apt-get -y install \
        'wget'

# download snap installer version 7.0
RUN wget http://step.esa.int/downloads/7.0/installers/esa-snap_sentinel_unix_7_0.sh

#change file execution rights for snap installer
RUN chmod +x esa-snap_sentinel_unix_7_0.sh

# install snap with gpt
RUN ./esa-snap_sentinel_unix_7_0.sh -q

# link gpt so it can be used systemwide
RUN ln -s /usr/local/snap/bin/gpt /usr/bin/gpt

# set gpt max memory to 4GB
RUN sed -i -e 's/-Xmx1G/-Xmx4G/g' /usr/local/snap/bin/gpt.vmoptions

# set entrypoint
ENTRYPOINT ["/usr/local/snap/bin/gpt"]
CMD ["-h"]
