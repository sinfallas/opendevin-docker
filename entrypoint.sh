#!/usr/bin/env bash
# Made by Sinfallas <sinfallas@yahoo.com>
# Licence: GPL-2
docker pull ghcr.io/opendevin/sandbox
cd /opt/opendevin/
python -m pipenv shell
uvicorn opendevin.server.listen:app --port 3000
#cd frontend
#npm start
