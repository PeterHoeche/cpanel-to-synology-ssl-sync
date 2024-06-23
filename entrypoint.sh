#!/bin/sh

# Convert DOMAINS from a comma-separated list to individual --domain arguments
DOMAIN_ARGS=$(echo $DOMAINS | tr "," " " | xargs -n 1 printf -- '--domain=%s ')
EXPORT_FOLDER="/usr/src/export"

exec ./cpanel-export-ssl -o $EXPORT_FOLDER -t "$CPANEL_AUTH" -e "$CPANEL_ENDPOINT" $DOMAIN_ARGS

exec ./synology-update-certificate -i "$SYNOLOGY_IP" -p "$SYNOLOGY_PORT" -u "$SYNOLOGY_USER" -w "$SYNOLOGY_PASS" -c $EXPORT_FOLDER  $DOMAIN_ARGS