FROM ubuntu:latest
#ENV email_username="username"
#ENV email_password="password"
#ENV UID="1000"
#ENV disable_plaintext_auth="yes"
# yes or no
#ENV ssl_cert="dovecot.pem"
#ENV ssl_key="dovecot.pem"
#ENV ssl="required"
#yes, no, or required
#ENV server_address="imap.example.com"
ENV pipeline_depth="1024"

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
