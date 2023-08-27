FROM ghcr.io/vp-en/qflood:nightly
RUN chgrp -R 0 /app /bin /run /config /home /media /package 2>/dev/null && chmod -R g=u /app /bin /run /config /home /media /package 2>/dev/null
