#!bin/bash
echo -e "[[local|localrc]]
ADMIN_PASSWORD=StrongAdminSecret
DATABASE_PASSWORD=$ADMIN_PASSWORD
RABBIT_PASSWORD=$ADMIN_PASSWORD
SERVICE_PASSWORD=$ADMIN_PASSWORD
HOST_IP=$(HOST_IP:-$(ip -f inet addr show enp0s8 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p'))
SERVICE_HOST=$HOST_IP
OS_AUTH_URL=http://$SERVICE_HOST:5000/v3.0">> /opt/stack/devstack/local.conf
