FROM ubuntu:18.04

LABEL maintainer="D3v <ESX-TEAM>"

EXPOSE 30120

WORKDIR /fivem

RUN apt update && apt install nodejs npm unzip wget python3 python3-pip -y

COPY python/ ./python/
RUN python3 -m pip install -r ./python/requirements.txt && python3 ./python/load_fivem.py > ./python/fivem_link

RUN mkdir ./server
RUN wget -i ./python/fivem_link
RUN tar xf fx.tar.xz -C ./server/

RUN mkdir ./server-data
RUN wget https://github.com/citizenfx/cfx-server-data/archive/refs/heads/master.tar.gz
RUN tar xf master.tar.gz -C ./server-data/ && mv ./server-data/cfx-server-data-master/* ./server-data/ && rm -r ./server-data/cfx-server-data-master

COPY files/ ./server-data/
RUN chmod +x ./server-data/reborn.sh

RUN mkdir ./server-data/resources/\[ESX\]
RUN wget https://github.com/esx-framework/esx-reborn/archive/refs/heads/main.tar.gz
RUN tar xf main.tar.gz -C ./server-data/resources/\[ESX\]/ && mv ./server-data/resources/\[ESX\]/esx-reborn-main ./server-data/resources/\[ESX\]/esx-reborn
RUN cd ./server-data/resources/\[ESX\]/esx-reborn && npm i

RUN wget https://github.com/GHMatti/ghmattimysql/releases/download/1.3.2/ghmattimysql.zip
RUN unzip ghmattimysql.zip -d ./server-data/resources/\[ESX\] && rm ./server-data/resources/\[ESX\]/ghmattimysql/config.json
