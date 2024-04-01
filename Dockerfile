FROM python:3.10.14-slim-bookworm
LABEL maintainer="sinfallas@gmail.com"

ENV PIPENV_VENV_IN_PROJECT=1
RUN mkdir -p /opt/opendevin
WORKDIR /opt/opendevin
RUN apt update && apt -y install --no-install-recommends --no-install-suggests rust-all nodejs npm docker.io containerd git curl nginx libnginx-mod-stream wget vim nano unzip zip build-essential && apt clean && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/OpenDevin/OpenDevin.git /opt/opendevin
RUN chmod -R 777 /opt/opendevin/
RUN pip install --upgrade pip
RUN pip install pipenv uvicorn
RUN pipenv requirements > requirements.txt && pip install -r requirements.txt
RUN cd frontend && npm install
COPY ./entrypoint.sh .
EXPOSE 80
EXPOSE 3000
CMD ["bash","/opt/opendevin/entrypoint.sh"]
