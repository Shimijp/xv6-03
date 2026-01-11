FROM ubuntu:16.04

# add from local directory
# ADD ./xv6-11 /xv6-11
RUN apt-get -qq update && \
# --no-install-recommends reduces the Image size by almost 15%,
# but in our case git needs --reinstall ca-certificates to work 
    apt-get install -y --no-install-recommends --reinstall ca-certificates \
                    git \
                    qemu-system \
                    make \
                    gcc-multilib \   
                    unzip \
    
   
#   &&chmod +x xv6-11/*.pl \
####
#    5 lines for general cleanning, -15% in size  
    &&apt-get purge -qq git \
    &&apt-get autoremove --purge -qq \
    &&apt-get clean -qq &&rm -rf /var/lib/apt/lists/* \
    &&rm -rf /tmp/* /var/tmp/* \
    &&rm -rf /usr/share/man/* /usr/share/doc/*
ADD xv6-01.zip /xv6-01.zip

RUN unzip /xv6-01.zip -d /xv6-01 \
    && ls -ll \
    && mv /xv6-01/xv6-01/* /xv6-01/ \
    && rm -rf /xv6-01/xv6-01 \
    && rm /xv6-01.zip \
    && chmod +x /xv6-01/*.pl
WORKDIR /xv6-01
#WORKDIR /xv6-11

CMD ["/bin/bash"]

