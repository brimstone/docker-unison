FROM brimstone/ubuntu:14.04

ENV HOME /root

RUN apt-get update && \
    apt-get install -y unison openssh-server dnsutils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

RUN ssh-keygen -f $HOME/.ssh/id_rsa -N "" && \
    cp $HOME/.ssh/id_rsa.pub $HOME/.ssh/authorized_keys

ADD root /

ENTRYPOINT [ "/unison-loader" ]

