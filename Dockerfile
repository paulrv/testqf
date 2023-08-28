FROM ghcr.io/vp-en/qflood:nightly
RUN chgrp -R 0      /app /bin /var/run /config /home /media /package /command /usr/bin 2>/dev/null \
    && chmod -R g=u /app /bin /var/run /config /home /media /package /command /usr/bin 2>/dev/null
