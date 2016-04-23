FROM debian:jessie

# ここは消したいオリジナルのイメージを作っておくべき
RUN \
  apt-get update && \
  apt-get install -y --force-yes --no-install-recommends curl ca-certificates wget && \
  apt-get clean

RUN \
  curl https://packages.treasuredata.com/GPG-KEY-td-agent | apt-key add - && \
  echo "deb http://packages.treasuredata.com/2/debian/jessie/ jessie contrib" > /etc/apt/sources.list.d/treasure-data.list && \
  apt-get update && \
  apt-get install -y --force-yes --no-install-recommends adduser td-agent wget ca-certificates && \
  apt-get clean && \
  mkdir -p /var/log/td-agent && \
  sed -i "s/USER=td-agent/USER=root/g" /etc/init.d/td-agent && \
  sed -i "s/GROUP=td-agent/GROUP=root/g" /etc/init.d/td-agent

ENV GEM_HOME /opt/td-agent/embedded/lib/ruby/gems/2.1.0/
ENV GEM_PATH /opt/td-agent/embedded/lib/ruby/gems/2.1.0/
ENV PATH /opt/td-agent/embedded/bin/:$PATH

VOLUME /var/log/td-agent

EXPOSE 24224

ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

CMD ["/usr/local/bin/docker-entrypoint.sh"]
