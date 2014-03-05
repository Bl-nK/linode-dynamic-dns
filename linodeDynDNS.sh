#!/usr/bin/env bash

#Usage ./linodeDynDNS.sh domainID resourceID API_Key ip_site
domainID=$1
resourceID=$2
api_key=$3
ip_site=$4

#Retrieve current public IP address
current_IP=$(curl -4 -s $ip_site)

#Current DNS Record
current_dns=$(curl -s "https://api.linode.com/?api_key=$api_key&api_action=domain.resource.list&DomainID=$domainID&ResourceID=$resourceID")

#Determine if current_dns is the same as current_IP
if [[ $(echo $current_dns | grep $current_IP) ]]; then
	exit 0
else
	#Update address to current_IP
	curl -s "https://api.linode.com/?api_key=$api_key&api_action=domain.resource.update&DomainID=$domainID&ResourceID=$resourceID&Target=$current_IP" > /dev/null
fi
