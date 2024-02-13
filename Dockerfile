FROM gcr.io/distroless/java17-debian12:latest AS pre-image
ARG DL_URL
ADD --chown=nobody:nobody --chmod=555 ${DL_URL} /app/JMusicBot.jar
WORKDIR /app/config

FROM scratch
COPY --from=pre-image / /
USER nobody:nobody
LABEL "org.opencontainers.image.description"="Containerized image for Jagrosh's MusicBot"
WORKDIR /app/config
ENTRYPOINT [ "java", "-Dnogui=true", "-Dconfig=/app/config/config.txt", "-jar", "/app/JMusicBot.jar"]
