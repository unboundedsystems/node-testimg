ARG NODE_VER=10.17-stretch-slim

FROM raviqqe/muffet:2.2.1 as muffet

FROM node:${NODE_VER}
ARG NODE_VER

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/google-cloud-sdk/bin

COPY --from=muffet /muffet /usr/local/bin/muffet

COPY ./node-testimg-install.sh /

RUN bash /node-testimg-install.sh && \
    rm /node-testimg-install.sh
