FROM raviqqe/muffet as muffet

FROM node:10.15.3-stretch-slim

COPY --from=muffet /muffet /usr/local/bin/muffet

RUN \
    echo deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main > /etc/apt/sources.list.d/ansible.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        ansible \
        apt-transport-https \
        bzip2 \
        ca-certificates \
        curl \
        g++ \
        git \
        gnupg2 \
        gyp \
        iputils-ping \
        less \
        make \
        moreutils \
        nginx-light \
        pigz \
        procps \
        python-pip \
        software-properties-common \
        ssh \
        unzip \
        vim \
        xz-utils \
    && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y --no-install-recommends docker-ce && \
    npm install yarn@~1.19.1 -g && \
    apt-get clean
