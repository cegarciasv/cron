#!/bin/bash
TOKEN="SaTdQ0b0i0ZT98H4CnlM8LXfAH5el20tXVTKl90lim4="
URL="https://192.168.0.66/api/cron/read-emails"

echo "[$(date)] Ejecutando curl..."
curl -k -H "Authorization: Bearer $TOKEN" "$URL"