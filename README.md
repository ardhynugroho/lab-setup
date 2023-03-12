# Lab Setup Script Collection

Collection of script to build lab environment

## Docker install script

This install script is a summary of installation steps from https://docs.docker.com/engine/install/ubuntu/

You might need to change user name `ubuntu` in the last line, to a user name used in your setup.

```
sudo addgroup ubuntu docker
sudo su ubuntu
```

### Proxy setting

If your environment is behind a proxy, you might need to setup proxy environment variable

1. Edit `/lib/systemd/system/docker.service` file 
2. Add following example under `[Service]` section, adjust the URL with your proxy URL

  ```
  [Service]
  Environment="HTTP_PROXY=http://192.168.1.1:5678"
  Environment="HTTPS_PROXY=https://192.168.1.1:5678"
  Environment="NO_PROXY=localhost,127.0.0.1,local-registry,.corp"
  ```
  
3. Do `systemctl daemon-reload`
4. Restart docker service `systemctl restart docker`

## K3s install script

This script installs K3s & remove shipped traefik ingress controller

You might need to update the `server` name to reflect your hostname

```
    if [ "$(kubectl get nodes server -o=jsonpath='{.status.conditions[3].status}')" == "True" ]; then
```

## Local Docker registry install script

Setup & run Docker local registry as K3s pod

## NGINX ingress controller install script

## Netplan configuration

Example configuration to configure IP addresses to be used as ExternalIP for kubernetes services:
- 99-dns.yaml -- DNS service ExternalIP
- 99-http.yaml -- Web-app ExternalIP

1. Update the content or create your own YAML file that fit your need
2. Copy the files to `/etc/netplan` 
3. Do `netplan apply`
