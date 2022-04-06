FROM ubuntu:20.04 AS build

RUN apt update && apt upgrade -y && apt install curl -y
RUN mkdir /harmony_node
WORKDIR /harmony_node
RUN curl -LO https://harmony.one/hmycli && mv hmycli hmy && chmod +x hmy
RUN curl -LO https://harmony.one/binary && mv binary harmony && chmod +x harmony

# these are the directories we will mount volumes to
RUN mkdir -p .hmy/blskeys
RUN mkdir harmony_dbs
RUN mkdir config

CMD [ "./harmony", "-C", "./config/harmony.conf"]