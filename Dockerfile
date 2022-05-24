FROM ubuntu:20.04 AS build

RUN apt update && apt upgrade -y && apt install curl jq -y
RUN mkdir /harmony_node
WORKDIR /harmony_node

# Always use latest CLI
RUN curl -LO https://harmony.one/hmycli && mv hmycli hmy && chmod +x hmy
# Download node binary by version
RUN curl -LO https://github.com/harmony-one/harmony/releases/download/v4.3.9/harmony && chmod +x harmony

# Copy over helpers scripts
COPY create_bls_key.sh /harmony_node/
COPY check_bingos.sh /harmony_node/
COPY check_pruning.sh /harmony_node/
RUN chmod +x create_bls_key.sh check_bingos.sh check_pruning.sh

# these are the directories we will mount volumes to
RUN mkdir -p .hmy/blskeys
RUN mkdir harmony_dbs
RUN mkdir config

CMD [ "./harmony", "-c", "./config/harmony.conf"]