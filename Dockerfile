FROM valyd8chain/hmy-cli:latest AS build

# Download node binary by version
RUN curl -LO https://github.com/harmony-one/harmony/releases/download/v4.3.12/harmony && chmod +x harmony

# Copy over helpers scripts
COPY check_bingos.sh /harmony_node/
COPY check_pruning.sh /harmony_node/
RUN chmod +x check_bingos.sh check_pruning.sh

# these are the directories we will mount volumes to
RUN mkdir -p .hmy/blskeys
RUN mkdir harmony_dbs
RUN mkdir config

CMD [ "./harmony", "-c", "./config/harmony.conf"]