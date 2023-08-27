FROM sch94/qflood:alpha
RUN chgrp -R 0 / && chmod -R g=u /
