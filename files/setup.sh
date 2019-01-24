#!/bin/bash
data_path=/data/kibana6.5
default_path=/home/kibana
kibana_path=/usr/local/kibana

if [ ! -d ${data_path} ];then
	mkdir -p ${data_path}
	cp -r ${default_path}/config ${data_path}/
	chown -R kibana:kibana ${data_path}
	echo "123"
	exec ${kibana_path}/bin/kibana
elif [ ! -f ${data_path}/config/kibana.yml ];then
	cp -a ${default_path}/config/kibana.yml ${data_path}/config/kibana.yml
	rm -rf ${kibana_path}/config/kibana.yml
	cp -a ${default_path}/config/kibana.yml ${kibana_path}/config/kibana.yml
	echo "456"
        exec ${kibana_path}/bin/kibana
else 
        cp -a ${data_path}/config/kibana.yml ${kibana_path}/config/kibana.yml
        echo "789"
	exec ${kibana_path}/bin/kibana
fi
