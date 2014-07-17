FROM ubuntu:14.04

RUN apt-get update -y
RUN apt-get install -y mercurial
RUN apt-get install -y git
RUN apt-get install -y curl
RUN apt-get install -y vim
RUN apt-get install -y strace
RUN apt-get install -y diffstat
RUN apt-get install -y pkg-config
RUN apt-get install -y cmake
RUN apt-get install -y build-essential
RUN apt-get install -y tcpdump

# Install go
RUN curl https://go.googlecode.com/files/go1.3.linux-amd64.tar.gz | tar -C /usr/local -zx
ENV GOROOT /usr/local/go
ENV PATH /usr/local/go/bin:$PATH

# Setup home environment
RUN useradd daisuke
RUN mkdir /home/daisuke && chown -R daisuke:daisuke /home/daisuke
RUN mkdir -p /home/daisuke/dev
ENV PATH /home/daisuke/dev/bin:$PATH
ENV GOPATH /home/daisuke/dev:$GOPATH

# Create a shared data volume
# We need to create an empty file, otherwise the volume will# belong to root.
# This is probably a Docker bug.
RUN mkdir /var/shared
RUN touch /var/shared/placeholder
RUN chown -R daisuke:daisuke /var/shared
VOLUME /var/shared
WORKDIR /home/daisuke
ENV HOME /home/daisuke

ADD vimrc /home/daisuke/.vimrc
ADD vim /home/daisuke/.vim
ADD bash_profile /home/daisuke/.bash_profile
ADD gitconfig /home/daisuke/.gitconfig

# Link in shared parts of the home directory
RUN ln -s /var/shared/.ssh
RUN ln -s /var/shared/.bash_history
RUN ln -s /var/shared/.maintainercfg
RUN chown -R daisuke:daisuke /home/daisuke
USER daisuke

CMD /bin/bash