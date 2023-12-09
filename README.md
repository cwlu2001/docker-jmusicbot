# JMusicBot
Containerized image for Jagrosh's MusicBot based on [distroless](https://github.com/GoogleContainerTools/distroless) image

## Run
### CLI
```bash
docker run -v /path_to_config_folder:/app/config -d --restart=unless-stopped --name=jmusicbot  cwlu2001/jmusicbot
```

### Docker compose (recommend)
docker-compose.yaml
```yaml
services:
  jmusicbot:
    image: cwlu2001/jmusicbot
    container_name: jmusicbot
    restart: unless-stopped
    volumes:
     - ./config:/app/config
```

## Folder structure
```
app
 ├── config
 │   ├── config.txt
 │   └── serversettings.txt
 └── JMusicBot.jar
```

+ [Setup guide](https://jmusicbot.com/)

+ [Github Source](https://github.com/cwlu2001/docker-jmusicbot)