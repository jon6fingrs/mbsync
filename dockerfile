FROM ubuntu:latest


RUN apt update && apt upgrade -y
RUN apt install -y isync
RUN apt install -y openssl
RUN apt install -y ca-certificates nano sudo cron


COPY .mbsyncrc /etc/.mbsyncrc
RUN mkdir -p /mail
RUN chmod 777 -R /mail
VOLUME /mail

COPY root /var/spool/cron/crontabs/root
RUN chown root:crontab /var/spool/cron/crontabs/root
RUN chmod 600 /var/spool/cron/crontabs/root

COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
