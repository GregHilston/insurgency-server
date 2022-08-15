# Based on https://github.com/GameServers/Insurgency
FROM gameservers/steamcmd

ENV APPID=237410
ENV APPDIR=/home/steamsrv/Insurgency
ENV APP_GAME_NAME insurgency
ENV APP_SERVER_PORT 27015
ENV APP_SERVER_MAXPLAYERS 24
ENV APP_SERVER_MAP market_coop
ENV APP_SERVER_NAME Gerk
ENV USE_SRCDS true

ADD ./game/cfg/server.cfg /home/steamsrv/server.cfg

expose ${APP_SERVER_PORT}/udp
expose ${APP_SERVER_PORT}

cmd /scripts/StartServer
