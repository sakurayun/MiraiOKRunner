#!/bin/bash

# download MiraiOK
if [ ! -e MiraiOK ]
then
    wget -c ${MIRAI_DOWNLOAD_URL} -O MiraiOK
fi

# download plugins
if [ ! -d "plugins" ]
then
    mkdir -p plugins
fi

if [ ! -e "plugins/mirai-api-http.jar" ]
then
    wget -c ${MIRAI_API_HTTP_DOWNLOAD_URL} -O plugins/mirai-api-http.jar
fi

# create config.txt
if [[ -z ${MIRAI_BOT_INFO} ]]
then
    echo -e "----------\nlogin ${MIRAI_BOT_INFO}" > config.txt
else
    echo "no environment variable MIRAI_BOT_INFO defined, exiting..."
    exit 1
fi

if [[ -z ${MIRAI_TEST_GROUP} && ${MIRAI_TEST_MESSAGE} ]]
then
    echo "say ${MIRAI_TEST_GROUP} ${MIRAI_TEST_MESSAGE}" >> config.txt
fi

# run MiraiOK
chmod +x ./MiraiOK
./MiraiOK
