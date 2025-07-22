# opendevin-docker
Run [OpenDevin](https://github.com/OpenDevin/OpenDevin) inside Docker

### Requirements

* [Docker](https://docs.docker.com/engine/install/)
* [Nvidia Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)

Build with the following command:

```bash
docker compose up --build
```

Then go to the url: http://127.0.0.1:8080 and in the configuration menu download the model: openchat:7b-v3.5-1210-q5_K_M

After finishing the download go to the url http://127.0.0.1

Get this image on Docker Hub: https://hub.docker.com/r/sinfallas/opendevin-docker


Opendevin git: https://github.com/OpenDevin/OpenDevin

Use the official image instead of this one (ghcr.io/opendevin/opendevin:0.5)

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=sinfallas/opendevin-docker&type=Date)](https://www.star-history.com/#sinfallas/opendevin-docker&Date)
