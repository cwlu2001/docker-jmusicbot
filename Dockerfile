FROM eclipse-temurin:11-jre
ARG DL_URL
ADD --chmod=755 ${DL_URL} /app/JMusicBot.jar
RUN \
    apt update && \
    apt install -y --no-install-recommends \
        chromium \
        chromium-chromedriver && \
    apt clean && \
    rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /usr/share/doc \
        /usr/share/man
WORKDIR /app/config
ENTRYPOINT [ "java", "-Dnogui=true", "-jar", "/app/JMusicBot.jar" ]
