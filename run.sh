#!/bin/bash

if [ -z ${pipeline_depth} ]; then export pipeline_depth=1024; fi

#useradd -m -u ${PUID} -G users,sudo -g users mbsync
chown ${PUID} -R /mail
chmod 774 -R /mail
sed -i "s/{host_name}/${host_name}/g" /etc/.mbsyncrc
sed -i "s/{port}/${port}/g" /etc/.mbsyncrc
sed -i "s/{remote_username}/${remote_username}/g" /etc/.mbsyncrc
sed -i "s/{remote_password}/${remote_password}/g" /etc/.mbsyncrc
sed -i "s/{ssltype}/${ssltype}/g" /etc/.mbsyncrc
sed -i "s/{sslversions}/${sslversions}/g" /etc/.mbsyncrc
sed -i "s/{mailbox_name}/${mailbox_name}/g" /etc/.mbsyncrc
sed -i "s/{pipeline_depth}/${pipeline_depth}/g" /etc/.mbsyncrc
sudo -u \#${PUID} mbsync -Va -c /etc/.mbsyncrc
