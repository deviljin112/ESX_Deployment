FROM ubuntu:18.04

LABEL maintainer="D3v <ESX-TEAM>"

EXPOSE 30120

WORKDIR /fivem

ADD python/* ./python/
RUN python3 -m pip install -r requirements.txt && python3 ./python/load_fivem.py > fivem_link

RUN mkdir ./server
RUN wget -i ./python/fivem_link
RUN apt update && apt install xz-utils nodejs unzip
RUN tar -xf fx.tar.xz -C ./server

RUN mkdir ./server-data
RUN wget https://github.com/citizenfx/cfx-server-data/archive/refs/heads/master.tar.gz
RUN tar -xf master.tar.gz -C ./server-data

ADD files/* ./server-data
RUN chmod +x ./server-data/run.sh

RUN mkdir ./server-data/resources/\[ESX\]
RUN wget https://github.com/esx-framework/esx-reborn/archive/refs/heads/main.tar.gz
RUN tar -xf main.tar.gz -C ./server-data/resource/\[ESX\]
RUN cd ./server-data/resource/\[ESX\] && npm i

RUN wget https://github.com/GHMatti/ghmattimysql/releases/download/1.3.2/ghmattimysql.zip
RUN unzip ghmattimysql.zip -d ./server-data/resource/\[ESX\] && rm ./server-data/resource/\[ESX\]/ghmattimysql/config.json
