FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y --no-install-recommends \
	ca-certificates \
	curl \
	bash \
	zsh \
	vim \
	git \
	bind9-dnsutils \
	bridge-utils \
	conntrack \
	ethtool \
	ipset \
	iptables \
	openssh-server \
	strace \
	jq \
	netcat-openbsd \
	ipython3 \
	scapy \
	iproute2 \
	iputils-ping \
	iputils-arping \
	mtr \
	traceroute \
	tcptraceroute \
	net-tools \
	tcpdump \
	tshark \
    bird2-doc \
    bird2 && \
    mkdir /run/bird && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

USER root
WORKDIR /root
ENV HOSTNAME=ya-kit

# ZSH Themes
RUN curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
COPY zshrc .zshrc
COPY motd motd

RUN chmod -R g=u /root
RUN chown root:root /usr/bin/dumpcap
 
CMD ["zsh"]
