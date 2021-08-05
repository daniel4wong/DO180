#/bin/bash

echo '>>> podman ps --format="{{.ID}} {{.Names}} {{.Image}}"'
podman ps --format="{{.ID}} {{.Names}} {{.Image}}"

echo '>>> podman logs nexus | grep JettyServer'
podman logs nexus | grep JettyServer

echo '>>> curl -v 127.0.0.1:18081/nexus/ 2>&1 | grep -E "HTTP|<title>"'
curl -v 127.0.0.1:18081/nexus/ 2>&1 | grep -E "HTTP|<title>"

echo '>>> Browse http://127.0.0.1:18081/nexus/ and login with admin (password: admin123)'
