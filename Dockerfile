FROM ghcr.io/vp-en/qflood:nightly
RUN chgrp -R 0 / 2>/dev/null && chmod -R g=u / 2>/dev/null
