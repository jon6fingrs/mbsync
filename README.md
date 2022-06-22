# mbsync
This container is an easy to get up and running mbsync instance. This program will sync a remote imap mailbox locally. As configured in the container, the email will be synchronized and deletions are not propogated in either direction.

https://isync.sourceforge.io/mbsync.html

I am not the author. The authors are much smarter than I am. I just packaged this amazing application in a docker container.

## Automatically Fetch Emails

This container needs either a cron job or systemd timer for the following command:

docker container start <container name>

I run this on my synology and have that command running every 5 minutes through the system tasks control panel.
  
Here is an example on how to call the container automatically every 5 minutes taken from the ArchWiki mbsync page. Obviously, the article has the example for the normal repo version of the application and so below is modified and should work for the docker version but please let me know if not.
  
https://wiki.archlinux.org/title/isync#Calling_mbsync_automatically
  

```
~/.config/systemd/user/mbsync.service

[Unit]
Description=Mailbox synchronization service

[Service]
Type=oneshot
ExecStart=docker container start <container name>

[Install]
WantedBy=default.target
```
  
The following timer configures mbsync to be started 2 minutes after boot, and then every 5 minutes:
```
~/.config/systemd/user/mbsync.timer

[Unit]
Description=Mailbox synchronization timer

[Timer]
OnBootSec=2m
OnUnitActiveSec=5m
Unit=mbsync.service

[Install]
WantedBy=timers.target
```
  
Once those two files are created, reload systemd, then enable and start mbsync.timer, adding the --user flag to systemctl.

Also consider using the below command to enable systemd timers for a particular user prior to login.

```
loginctl enable-linger username
```
  
From what I read, cronjobs are not ideal for a task like this which could potentially run for an extended period of time.
