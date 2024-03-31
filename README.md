# opendevin-docker
Run [OpenDevin](https://github.com/OpenDevin/OpenDevin) inside Docker

### Requirements

* [Docker](https://docs.docker.com/engine/install/)
* [Nvidia Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)

Build with the following command:

```bash
docker compose up --build
```

Then go to the url: http://127.0.0.1:8080 and in the configuration menu download the model: openchat:7b-v3.5-1210

After finishing the download go to the url http://127.0.0.1
