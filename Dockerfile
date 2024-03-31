FROM python:3.10.14-slim-bookworm
LABEL maintainer="sinfallas@gmail.com"

WORKDIR /opt/opendevin
RUN apt-get update && apt -y install rust-all nodejs npm docker.io containerd git
RUN git clone https://github.com/OpenDevin/OpenDevin.git /opt/opendevin
RUN pip install --upgrade pip
RUN python -m pip install pipenv uvicorn
RUN cp config.toml.template config.toml
##RUN python -m pipenv requirements > requirements.txt && python -m pip install -r requirements.txt
RUN python -m pipenv install -v
RUN cd frontend && npm install
COPY ./entrypoint.sh .
EXPOSE 3001
CMD ["bash","/opt/opendevin/entrypoint.sh"]
