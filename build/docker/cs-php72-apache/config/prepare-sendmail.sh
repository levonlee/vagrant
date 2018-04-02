#!/bin/sh
echo "Updating /etc/hosts..."
echo "127.0.0.1 localhost localhost.localdomain $(hostname)" >> /etc/hosts
echo "Restarting sendmail..."
service sendmail restart
