FROM concourse/busyboxplus:git

ENV LANG C

ADD http://stedolan.github.io/jq/download/linux64/jq /usr/local/bin/jq
RUN chmod +x /usr/local/bin/jq

ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/*

ADD built-out /opt/go/out
RUN chmod +x /opt/go/out

ADD test/ /opt/resource-tests/
RUN /opt/resource-tests/all.sh
