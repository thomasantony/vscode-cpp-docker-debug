FROM gcc:8.2

RUN apt-get update && apt-get install -y gdbserver gdb cmake && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# for gdbserver
EXPOSE 2000

VOLUME /src
WORKDIR /src/build