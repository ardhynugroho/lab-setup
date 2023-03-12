# Lab Setup Script Collection

Collection of script to build lab environment

## Docker install script

A summary of install steps from https://docs.docker.com/engine/install/ubuntu/

You might need to change user name `ubuntu` in the last line, to a user name used in your setup.

```
sudo addgroup ubuntu docker
sudo su ubuntu
```

### Proxy setting

If your environment is behind a proxy, you might need to setup proxy environment variable

1. Edit file `/lib/systemd/system/docker.service` file 
2. Add following under `[Service]` section

  ```
  [Service]
  Environment="HTTP_PROXY=http://proxy.example.com:80"
  Environment="HTTPS_PROXY=https://proxy.example.com:443"
  Environment="NO_PROXY=localhost,127.0.0.1,docker-registry.example.com,.corp"
  ```
3. Do `systemctl daemon-reload`
4. Restart docker service `systemctl restart docker`

## K3s install script

## Local Docker registry install script

## NGINX ingress controller install script

## Netplan configuration

Used to configure IP address to be used as ExternalIP for kubernetes services.

Example:
- 99-dns.yaml -- DNS service ExternalIP
- 99-http.yaml -- Web-app ExternalIP

Copy the files to `/etc/netplan` then do `netplan apply`.
