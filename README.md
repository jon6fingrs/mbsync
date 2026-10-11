# mbsync

> **This repository is no longer maintained.** It has been replaced by
> [mailstack](https://github.com/jon6fingrs/mailstack), which brings mbsync,
> Dovecot 2.4 and fast full-text search together in one repo, with tested
> images for amd64 and arm64. It includes everything this repo did.
>
> Your existing mail folder works with it as is, so nothing gets downloaded
> again: see [MIGRATING.md](https://github.com/jon6fingrs/mailstack/blob/main/MIGRATING.md).
> The `thehelpfulidiot/*` images on Docker Hub stay available but won't be
> updated.

easy to get up and running mbsync instance

There are two ways to run this container. You can run with the cron variable "yes" and mbsync will run, and then after completion, cron will open and will sync mail every 5 miunutes, all within the container.

Alternatively, you can set cron to "off" and the container will simply run once each time its called. So for regular email syncing, you would need something like a cron job or systemd timer for the following command:

docker container start mail-backup

https://hub.docker.com/repository/docker/thehelpfulidiot/mbsync/general

See how to combine mbsync (clone remote mailbox), dovecot (serve mailbox as local IMAP server), and solr (index mailbox for better searching):
https://github.com/jon6fingrs/mbsync-dovecot
