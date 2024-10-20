#!/bin/bash

if [ -z ${pipeline_depth} ]; then export pipeline_depth=1024; fi
if [ -z ${ssltype} ]; then export ssltype=IMAPS; fi
if [ -z ${port} ]; then export port=993; fi
if [ -z ${sslversions} ]; then export sslversions="[TLSv1] [TLSv1.1] [TLSv1.2] [TLSv1.3]"; fi

if id -u ${PUID} >/dev/null 2>&1; then
    # If a user with PUID exists, get the username associated with it
    old_user=$(getent passwd "${PUID}" | cut -d: -f1)
    # Rename the old user to mbsync
    usermod -l mbsync "${old_user}"
else
    # If no user with PUID exists, create a new user
    useradd -m -u ${PUID} -G users,sudo -g users mbsync
fi



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
if [[ ${cron} = "yes" ]]; then cron -f; fi
