FROM debian:bullseye

RUN apt-get update && apt-get install -y curl cron

COPY read-emails.sh /usr/local/bin/read-emails.sh
COPY crontab.txt /etc/cron.d/mycron

RUN chmod +x /usr/local/bin/read-emails.sh && chmod 0644 /etc/cron.d/mycron
RUN crontab /etc/cron.d/mycron
RUN touch /var/log/cron.log

CMD ["cron", "-f"]