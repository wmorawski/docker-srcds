FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
RUN useradd -m steam \
      && apt-get update \ 
      && apt-get install wget -y \
      && dpkg --add-architecture i386 \
      && apt-get update \
      && apt-get install lib32stdc++6 lib32gcc1 -y
USER steam
WORKDIR /home/steam
ADD --chown=steam:steam https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz /home/steam/
COPY --chown=steam:steam csgo_install.txt /home/steam/
COPY --chown=steam:steam csgo_update.txt /home/steam/
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
  && tar xvf steamcmd_linux.tar.gz
RUN /bin/bash /home/steam/steamcmd.sh +runscript /home/steam/csgo_install.txt
COPY --chown=steam:steam entry.sh /home/steam/
EXPOSE 27015/udp
RUN ls
ENTRYPOINT ["/bin/bash", "entry.sh"]