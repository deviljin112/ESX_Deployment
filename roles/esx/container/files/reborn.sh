#!/bin/sh

cd /fivem/server-data

sed -i "s/{SQL_DEFAULT_USERNAME}/$SQL_USERNAME/g" server.cfg
sed -i "s/{SQL_DEFAULT_PASSWORD}/$SQL_PASSWORD/g" server.cfg
sed -i "s/{SQL_CONTAINER_NAME}/$SQL_HOSTNAME/g" server.cfg
sed -i "s/{SQL_DEFAULT_DATABASE}/$SQL_DATABASE/g" server.cfg
sed -i "s/{RCON}/$ESX_RCONPASS/g" server.cfg
sed -i "s/{HOSTNAME}/$ESX_HOSTNAME/g" server.cfg
sed -i "s/{STEAM_WEB_API_KEY}/$ESX_STEAMKEY/g" server.cfg
sed -i "s/{LICENSE_KEY}/$ESX_LICENSE/g" server.cfg

bash /fivem/server/run.sh +exec server.cfg