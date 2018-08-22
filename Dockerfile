FROM debian:latest

RUN apt-get update && \
    apt-get -y install \
      'wget'

# install snap
RUN wget http://step.esa.int/downloads/6.0/installers/esa-snap_sentinel_unix_6_0.sh && \
    sh esa-snap_sentinel_unix_6_0.sh -q && \
    rm esa-snap_sentinel_unix_6_0.sh

# update snap
RUN snap --nosplash --nogui --modules --update-all

# set gpt max memory to 32GB
RUN sed -i -e 's/-Xmx1G/-Xmx32G/g' /usr/local/snap/bin/gpt.vmoptions

# set entrypoint
ENTRYPOINT ["/usr/local/snap/bin/gpt"]
CMD ["-h"]