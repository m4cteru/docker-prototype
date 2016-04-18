#https://github.com/tcnksm/dockerfile-rbenv/blob/master/Dockerfile
FROM debian:jessie

MAINTAINER tcnksm "https://github.com/tcnksm"

ENV RUBY_VERSION="2.2.4"

# Install packages for building ruby
RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y --force-yes \
       ca-certificates build-essential curl git zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev \
       libmysqlclient-dev \
    && apt-get clean

# Install rbenv and ruby-build
RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv \
    && git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build \
    && /root/.rbenv/plugins/ruby-build/install.sh \
    && echo 'export PATH=/root/.rbenv/bin:$PATH\neval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh \
    && echo 'gem: --no-rdoc --no-ri' >> .gemrc

RUN bash -lc "rbenv install ${RUBY_VERSION}" \
    && bash -lc "rbenv global ${RUBY_VERSION}" \
    && bash -lc "gem install bundle"

RUN ln -sf /dev/stdout /var/log/unicorn.stdout.log \
	&& ln -sf /dev/stderr /var/log/unicorn.stderr.log

EXPOSE 8080

VOLUME ["/var/app"]

ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

CMD ["bash", "-lc", "/usr/local/bin/docker-entrypoint.sh"]
