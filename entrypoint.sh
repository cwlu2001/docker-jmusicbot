#!/bin/bash
CONFIG="/app/config/config.txt"

cp /app/config/config.txt /app/config.txt &>/dev/null

if [[ -f "/app/config.txt" ]]; then
    CONFIG="/app/config.txt"

    if [[ ! -z  $(grep ^chromepath < $CONFIG) ]]; then
        sed -i 's|^chromepath|//chromepath|g' $CONFIG
    fi
    if [[ ! -z  $(grep ^chromedriverpath < $CONFIG) ]]; then
        sed -i 's|^chromedriverpath|//chromedriverpath|g' $CONFIG
    fi
    if [[ ! -z  $(grep ^chromeheadless < $CONFIG) ]]; then
        sed -i 's|^chromeheadless|//chromeheadless|g' $CONFIG
    fi

    chrome='chromepath="/usr/bin/chromium-browser"'
    driver='chromedriverpath="/usr/bin/chromedriver"'
    headless='chromeheadless=true'
    printf "%s\n" $chrome $driver $headless >> $CONFIG
fi

exec java -Dnogui=true -Dconfig=$CONFIG -jar /app/JMusicBot.jar
