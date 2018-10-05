# gsdock/Dockerfile

FROM debian:jessie-slim
LABEL maintainer "And Grin <a@grin.ly>"

WORKDIR /gs
ADD https://www.goodsync.com/download/goodsync-release-x86_64.tar.gz /gs/goodsync-release-x86_64.tar.gz
RUN mkdir /data &&\
	tar xvzf goodsync-release-x86_64.tar.gz --strip-components=1 &&\
	rm /gs/goodsync-release-x86_64.tar.gz

# root filesystem
COPY rootfs /

EXPOSE 33333 11000 4444

VOLUME ["/data", "/root/.goodsync"]
CMD ["/gs/gsserver.sh"]
