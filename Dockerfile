FROM ubuntu:20.04 AS build

RUN apt update && apt upgrade -y && apt install curl -y
RUN mkdir /harmony_node
WORKDIR /harmony_node

# Always use latest CLI
RUN curl -LO https://harmony.one/hmycli && mv hmycli hmy && chmod +x hmy
# Download node binary by version
RUN curl -LO https://github.com/harmony-one/harmony/releases/download/v4.3.7/harmony && chmod +x harmony

# these are the directories we will mount volumes to
RUN mkdir -p .hmy/blskeys
RUN mkdir harmony_dbs
RUN mkdir config

CMD [ "./harmony", "-c", "./config/harmony.conf"]