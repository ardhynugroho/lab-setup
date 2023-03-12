# Lab Setup Script Collection

Collection of script to build lab environment

## Docker install script

A summary of installation steps from https://docs.docker.com/engine/install/ubuntu/

User name `ubuntu` in the last line might need to be changed to other user name

```
sudo addgroup ubuntu docker
sudo su ubuntu
```

### Proxy setting

If the environment is behind a proxy, HTTP_PROXY environment variable might need to be defined

1. Edit `/lib/systemd/system/docker.service` file 
2. Add following example under `[Service]` section, the URL might need to be adjusted

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

The `server` name might need to be changed to reflect current hostname

```
    if [ "$(kubectl get nodes server -o=jsonpath='{.status.conditions[3].status}')" == "True" ]; then
```

### Proxy setting

If the environment is behind a proxy, HTTP_PROXY environment variable might need to be defined

1. Edit `/etc/systemd/system/k3s.service` file 
2. Add following example under `[Service]` section, the URL might need to be adjusted

  ```
  [Service]
  Environment="HTTP_PROXY=http://192.168.1.1:5678"
  Environment="HTTPS_PROXY=https://192.168.1.1:5678"
  Environment="NO_PROXY=localhost,127.0.0.1,local-registry,.corp"
  ```
  
3. Do `systemctl daemon-reload`
4. Restart docker service `systemctl restart k3s`

## Local Docker registry install script

Setup & run Docker local registry as K3s pod

## NGINX ingress controller install script

A summary of installation step from https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-manifests/

## Netplan configuration

Example configuration to configure IP addresses to be used as ExternalIP for kubernetes services:

1. Update the content or create your own YAML file to fit the requirement/need
2. Copy the YAML file to `/etc/netplan` 
3. Do `netplan apply`
