FROM eclipse-temurin:11-jre
ARG DL_URL
ADD --chmod=755 ${DL_URL} /app/JMusicBot.jar
COPY --chmod=755 entrypoint.sh /entrypoint.sh
RUN \
    apt update && \
    apt install -y --no-install-recommends \
        bash \
        chromium \
        chromium-chromedriver && \
    apt clean && \
    rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /usr/share/doc \
        /usr/share/man
WORKDIR /app/config
ENTRYPOINT [ "/entrypoint.sh" ]
