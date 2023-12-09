FROM gcr.io/distroless/java17-debian12:nonroot
USER nobody:nobody
LABEL "org.opencontainers.image.description"="Containerized image for Jagrosh's MusicBot"
ARG DL_URL
WORKDIR /app/config
ADD --chown=nobody:nobody --chmod=555 ${DL_URL} /app/JMusicBot.jar
ENTRYPOINT [ "java", "-Dnogui=true", "-Dconfig=/app/config/config.txt", "-jar", "/app/JMusicBot.jar"]