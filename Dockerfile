FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y iproute2 net-tools
RUN apt install -y git vim wget curl
RUN apt install -y gdbserver gdb strace ltrace netcat-openbsd socat
RUN apt install -y python3 python3-pip python3-ipython python3-pwntools tmux
RUN echo "alias ipython='python3 -m IPython'" >> /root/.bashrc
RUN rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/pwndbg/pwndbg/releases/download/2025.05.30/pwndbg_2025.05.30_amd64.deb
RUN apt install -y ./pwndbg_2025.05.30_amd64.deb
RUN rm ./pwndbg_2025.05.30_amd64.deb

COPY gdbinit /root/.gdbinit
WORKDIR /root

CMD ["tail", "-f", "/dev/null"]
