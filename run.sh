#!/bin/bash


useradd -m -u ${PUID} -G users,sudo -g users mbsync
chown mbsync -R /mail
chown 644 -R /mail
#sed -i "s/{host_name}/${host_name}/g" /etc/.mbsyncrc
#sed -i "s/{port}/${port}/g" /etc/.mbsyncrc
#sed -i "s/{remote_username}/${remote_username}/g" /etc/.mbsyncrc
#sed -i "s/{remote_password}/${remote_password}/g" /etc/.mbsyncrc
#sed -i "s/{ssltype}/${ssltype}/g" /etc/.mbsyncrc
#sed -i "s/{sslversions}/${sslversions}/g" /etc/.mbsyncrc
#sed -i "s/{mailbox_name}/${mailbox_name}/g" /etc/.mbsyncrc
mbsync -Va -c /etc/.mbsyncrc
