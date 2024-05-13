FROM gcr.io/distroless/java17-debian12:latest AS pre-image
ARG DL_URL
ADD --chmod=555 ${DL_URL} /app/JMusicBot.jar

FROM scratch
COPY --from=pre-image / /
USER 1000:1000
WORKDIR /app/config
ENTRYPOINT [ "java", "-Dnogui=true", "-Dconfig=/app/config/config.txt", "-jar", "/app/JMusicBot.jar"]
