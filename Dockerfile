FROM eclipse-temurin:21-jre-alpine
RUN addgroup -g 1000 user && \
    adduser -D -u 1000 -G user user && \
    mkdir /app && \
    chown user:user /app && \
    apk add --no-cache \
        bash \
        chromium \
        chromium-chromedriver

USER user:user
ARG JMB=https://github.com/cwlu2001/MusicBot/releases/download/0.4.4-dev.5/JMusicBot-0.4.4-dev.5.jar
ADD --chmod=755 ${JMB} /app/JMusicBot.jar
COPY --chmod=755 entrypoint.sh /entrypoint.sh
ENV CHROMIUM_USER_FLAGS=--no-sandbox
WORKDIR /app/config
ENTRYPOINT [ "/entrypoint.sh" ]
