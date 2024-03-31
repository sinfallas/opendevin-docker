FROM python:3.10.14-slim-bookworm
LABEL maintainer="sinfallas@gmail.com"

ENV PIPENV_VENV_IN_PROJECT=1
WORKDIR /opt/opendevin
RUN apt-get update && apt -y install rust-all nodejs npm docker.io containerd git curl nginx libnginx-mod-stream
RUN git clone https://github.com/OpenDevin/OpenDevin.git /opt/opendevin
RUN pip install --upgrade pip
RUN pip install pipenv uvicorn
RUN cp config.toml.template config.toml
RUN pipenv requirements > requirements.txt && pip install -r requirements.txt
#RUN pipenv install -v
RUN cd frontend && npm install
COPY ./entrypoint.sh .
EXPOSE 80
EXPOSE 3000
EXPOSE 3001
CMD ["bash","/opt/opendevin/entrypoint.sh"]
