FROM ghcr.io/vp-en/qflood:nightly
RUN chgrp -R 0 / && chmod -R g=u /
