FROM ubuntu:latest


RUN apt update && apt upgrade -y
RUN apt install -y isync
RUN apt install -y openssl
RUN apt install -y ca-certificates nano sudo


COPY .mbsyncrc /etc/.mbsyncrc
RUN mkdir -p /mail
RUN chmod 777 -R /mail
VOLUME /mail


COPY run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]
