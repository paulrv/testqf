FROM clearlinux:latest
RUN swupd bundle-add curl nodejs-basic && swupd clean --all && npm i -g @jesec/flood && curl -L https://github.com/userdocs/qbittorrent-nox-static/releases/download/release-4.5.4_v2.0.9/x86_64-qbittorrent-nox -o /usr/bin/qbittorrent-nox && chmod +x /usr/bin/qbittorrent-nox
RUN mkdir -p /config/qBittorrent/config /downloads/temp \
    && touch /config/qBittorrent/config/qBittorrent.conf \
    && echo "[BitTorrent]" >> /config/qBittorrent/config/qBittorrent.conf \
    && echo "Session\DefaultSavePath=/downloads" >> /config/qBittorrent/config/qBittorrent.conf \
    && echo "Session\Port=6881"  >> /config/qBittorrent/config/qBittorrent.conf \
    && echo "Session\TempPath=/downloads/temp" >> /config/qBittorrent/config/qBittorrent.conf \
    && echo " " >> /config/qBittorrent/config/qBittorrent.conf \
    && echo "[LegalNotice]" >> /config/qBittorrent/config/qBittorrent.conf \
    && echo "Accepted=true" >> /config/qBittorrent/config/qBittorrent.conf \
    && echo "#!/bin/sh" > /usr/bin/start.sh && chmod +x /usr/bin/start.sh \
    && echo "(/usr/bin/flood --rundir /config/flood --host 0.0.0.0 --port 3000 &); (/usr/bin/qbittorrent-nox --profile=/config --webui-port=8000 &)" >> /usr/bin/start.sh \
    && chgrp -R 0 /config /downloads /var /usr/bin/start.sh && chmod -R g+rwX /config /downloads /var /usr/bin/start.sh


ENTRYPOINT ["/usr/bin/start.sh"] 


EXPOSE 3000 8000 6881 
EXPOSE 6881/udp
