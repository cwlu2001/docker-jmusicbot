# JMusicBot
![ci] ![docker_pulls] ![docker_image_size]

[ci]: https://github.com/cwlu2001/docker-build/actions/workflows/jmusicbot.yml/badge.svg
[docker_pulls]: https://img.shields.io/docker/pulls/cwlu2001/jmusicbot?logo=docker
[docker_image_size]: https://img.shields.io/docker/image-size/cwlu2001/jmusicbot?logo=docker


## Run

### Docker Compose (devbuild)
docker-compose.yaml
```yaml
services:
  jmusicbot:
    image: cwlu2001/jmusicbot:latest-dev
    container_name: jmusicbot
    restart: unless-stopped
    volumes:
      - ./config:/app/config
```

---

### CLI
```bash
docker run -v /path_to_config_folder:/app/config -d --restart=unless-stopped --name=jmusicbot cwlu2001/jmusicbot:latest
```

### Docker Compose
docker-compose.yaml
```yaml
services:
  jmusicbot:
    image: cwlu2001/jmusicbot:latest
    container_name: jmusicbot
    restart: unless-stopped
    volumes:
      - ./config:/app/config
```

## Tags
Since JMusicBot [0.3.9](https://github.com/jagrosh/MusicBot/releases/tag/0.3.9)
+ `latest-dev`, `0.4.4-dev.7` updated yt source manager to solve playback issue again
+ `0.4.4-dev.6` with updated yt source manager to solve playback issue in previous tags
+ `0.4.4-dev.5`, `0.4.4-dev.4` uses [my fork](https://github.com/cwlu2001/MusicBot/tree/fix-youtube), with automatic retrieval of PO token implemented by MichailiK
+ `0.4.4-dev.2`, `0.4.4-dev.3` uses [my fork](https://github.com/cwlu2001/MusicBot/tree/fix-youtube), with YT Proof of Origin (PO) token implemented by MichailiK
+ `0.4.4-dev.1` with YouTube OAuth2 implementation by MichailiK ( Patched by YT, not working)
+ `0.4.0-hotfix` uses [MichailiK's fork](https://github.com/MichailiK/MusicBot/releases) to solve youtube playback issue


## Get PO Token Manually (`0.4.4-dev.2`, `0.4.4-dev.3`)
According to [#1772](https://github.com/jagrosh/MusicBot/pull/1772)
1. Run the script: `docker run quay.io/invidious/youtube-trusted-session-generator`
2. Copy generated `po_token`, `visitor_data` into your `config.txt`

[Example config](https://github.com/MichailiK/MusicBot/blob/7be02b1/src/main/resources/reference.conf#L206-L207)


## Folder Tree
```
/app
├── JMusicBot.jar
└── config
    ├── config.txt
    └── serversettings.json
```

---
+ [JMusicBot](https://github.com/jagrosh/MusicBot)
+ [Setup Guide](https://jmusicbot.com/)
+ [Container Source](https://github.com/cwlu2001/docker-jmusicbot)
+ [Build Workflow](https://github.com/cwlu2001/docker-build/actions/workflows/jmusicbot.yml)
