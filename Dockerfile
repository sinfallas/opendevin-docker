FROM python:3.10.14-slim-bookworm
LABEL maintainer="sinfallas@gmail.com"

ENV PIPENV_VENV_IN_PROJECT=1
WORKDIR /opt/opendevin
RUN apt update && apt -y install --no-install-recommends --no-install-suggests rust-all nodejs npm docker.io containerd git curl nginx libnginx-mod-stream
RUN git clone https://github.com/OpenDevin/OpenDevin.git /opt/opendevin
RUN pip install --upgrade pip
RUN pip install pipenv uvicorn
RUN echo 'LLM_BASE_URL="http://ollama:11434"' > /opt/opendevin/config.toml
RUN echo 'LLM_API_KEY="ollama"' >> /opt/opendevin/config.toml
RUN echo 'WORKSPACE_DIR="./workspace"' >> /opt/opendevin/config.toml
RUN echo 'LLM_MODEL="openchat:7b-v3.5-1210-q5_K_M"' >> /opt/opendevin/config.toml
RUN echo 'LLM_EMBEDDING_MODEL="ollama_chat/nomic-embed-text:latest"' >> /opt/opendevin/config.toml
RUN pipenv requirements > requirements.txt && pip install -r requirements.txt
RUN cd frontend && npm install
COPY ./entrypoint.sh .
EXPOSE 80
EXPOSE 3000
EXPOSE 3001
CMD ["bash","/opt/opendevin/entrypoint.sh"]
