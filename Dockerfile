FROM debian:jessie

MAINTAINER João Antonio Ferreira "joao.parana@gmail.com"

ENV REFRESHED_AT 2017-01-11


ENV PANDOC_HOME  /usr/local/pandoc

ENV DEB /tmp/install/pandoc-1.19.1-1-amd64.deb

ADD install /tmp/install

WORKDIR $PANDOC_HOME

# On Debian, I need Update distro before install any package
RUN apt-get update
RUN apt-get install -y libgmp10
RUN dpkg -i $DEB && \
    rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]

# ENTRYPOINT ["/config-or-run-app"]

