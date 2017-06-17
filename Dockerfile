FROM alpine

VOLUME /data
COPY generate-motd.sh /

RUN apk update && apk add imagemagick coreutils perl git figlet texinfo openjdk8 make
WORKDIR /root
RUN git clone https://github.com/maandree/util-say
WORKDIR /root/util-say
RUN mkdir tmp
RUN export JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk/ && export PATH=${PATH}:/usr/lib/jvm/java-1.8-openjdk/bin && make
RUN sed -i'' 's@--import image@--import image --right 5 --top 1@g' /root/util-say/img2ponysay

ENTRYPOINT ["/generate-motd.sh"]
