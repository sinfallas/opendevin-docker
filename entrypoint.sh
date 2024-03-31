#!/usr/bin/env bash
# Made by Sinfallas <sinfallas@yahoo.com>
# Licence: GPL-2
echo 'LLM_BASE_URL="http://ollama:11434"' > /opt/opendevin/config.toml
echo 'LLM_API_KEY="ollama"' >> /opt/opendevin/config.toml
echo 'WORKSPACE_DIR="./workspace"' >> /opt/opendevin/config.toml
echo 'LLM_MODEL="ollama/openchat:7b-v3.5-1210"' >> /opt/opendevin/config.toml
echo 'LLM_EMBEDDING_MODEL="ollama_chat/nomic-embed-text:latest"' >> /opt/opendevin/config.toml
docker pull ghcr.io/opendevin/sandbox
nginx
cd /opt/opendevin/
uvicorn opendevin.server.listen:app --host 0.0.0.0 --port 3000 &
cd /opt/opendevin/frontend
npm start
