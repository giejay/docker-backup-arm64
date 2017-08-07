FROM mickaelguene/arm64-debian 
# Install cron
RUN apt-get update
RUN apt-get install -y cron git

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/simple-cron
#ADD crontab-additional /etc/cron.d/additional-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/simple-cron
#RUN chmod 0644 /etc/cron.d/additional-cron

# Add backup script
ADD backup.sh /backup.sh
ADD pre-backup.sh /pre-backup.sh

# Give execution rights backup.sh
RUN chmod +x /backup.sh
RUN chmod +x /pre-backup.sh

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

RUN echo "test" > /var/log/cron.log

#RUN service cron start

# Run the command on container startup
CMD cron && sleep 15 && touch /etc/cron.d/simple-cron && tail -f /var/log/cron.log
