FROM --platform=linux/amd64 eclipse-temurin:11-jre-alpine AS base-amd64
FROM --platform=linux/arm64 eclipse-temurin:21-jre-alpine AS base-arm64

FROM base-${TARGETARCH}
ARG DL_URL
ADD --chmod=755 ${DL_URL} /app/JMusicBot.jar
WORKDIR /app/config
ENTRYPOINT [ "java", "-Dnogui=true", "-jar", "/app/JMusicBot.jar" ]
