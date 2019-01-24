#bash image
FROM centos
RUN \cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && yum install -y wget vim net-tools \
    && cd mnt \
    && wget https://artifacts.elastic.co/downloads/kibana/kibana-6.5.4-linux-x86_64.tar.gz \
    && tar zxf kibana-6.5.4-linux-x86_64.tar.gz \
    && mv kibana-6.5.4-linux-x86_64 /usr/local/kibana \
    && groupadd kibana \
    && useradd -g kibana kibana \
    && cp -r /usr/local/kibana/config /home/kibana/ \
    && rm -rf /mnt/* \
    && yum clean all 

ADD ./files/setup.sh /tmp/setup.sh
RUN chmod 755 /tmp/setup.sh


ENTRYPOINT ["/tmp/setup.sh"]
