#!/usr/bin/env bash
# Made by Sinfallas <sinfallas@yahoo.com>
# Licence: GPL-2
docker pull ghcr.io/opendevin/sandbox
cd /opt/opendevin/
uvicorn opendevin.server.listen:app --port 3000 &

