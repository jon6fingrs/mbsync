# mbsync
easy to get up and running mbsync instance

There are two ways to run this container. You can run with the cron variable "yes" and mbsync will run, and then after completion, cron will open and will sync mail every 5 miunutes, all within the container.

Alternatively, you can set cron to "off" and the container will simply run once each time its called. So for regular email syncing, you would need something like a cron job or systemd timer for the following command:

docker container start mail-backup

https://hub.docker.com/repository/docker/thehelpfulidiot/mbsync/general

See how to combine mbsync (clone remote mailbox), dovecot (serve mailbox as local IMAP server), and solr (index mailbox for better searching):
https://github.com/jon6fingrs/mbsync-dovecot
