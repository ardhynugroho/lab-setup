#!/bin/bash
#
# NGINX OSS Ingress Controller install script
#

set -x

git clone https://github.com/nginxinc/kubernetes-ingress.git --branch v3.0.1
cd kubernetes-ingress/deployments

# create name space & service account
kubectl apply -f common/ns-and-sa.yaml

# create RBAC
kubectl apply -f rbac/rbac.yaml
kubectl apply -f rbac/ap-rbac.yaml
kubectl apply -f common/default-server-secret.yaml
kubectl apply -f common/nginx-config.yaml
kubectl apply -f common/ingress-class.yaml

# create CRDs
kubectl apply -f common/crds/k8s.nginx.org_virtualservers.yaml
kubectl apply -f common/crds/k8s.nginx.org_virtualserverroutes.yaml
kubectl apply -f common/crds/k8s.nginx.org_transportservers.yaml
kubectl apply -f common/crds/k8s.nginx.org_policies.yaml
kubectl apply -f common/crds/k8s.nginx.org_globalconfigurations.yaml

# deploy ingress
kubectl apply -f daemon-set/nginx-ingress.yaml

# KIC service
kubectl apply -f service/nodeport.yaml
