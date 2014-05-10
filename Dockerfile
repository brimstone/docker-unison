FROM brimstone/ubuntu:14.04

ENV HOME /root

RUN apt-get update && \
    apt-get install -y unison && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

ADD root /

ENTRYPOINT [ "/unison-loader" ]

