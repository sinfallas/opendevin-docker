#!/usr/bin/env bash
# Made by Sinfallas <sinfallas@yahoo.com>
# Licence: GPL-2
docker pull ghcr.io/opendevin/sandbox
nginx
cd /opt/opendevin/
uvicorn opendevin.server.listen:app --host 0.0.0.0 --port 3000 &
cd /opt/opendevin/frontend
npm start
