#!/usr/bin/env bash

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.4/aio/deploy/recommended.yaml

# kubectl get pods -n kubernetes-dashboard
# kubectl get svc -n kubernetes-dashboard
# kubectl proxy
# kubectl port-forward -n kubernetes-dashboard svc/kubernetes-dashboard 4443:443

# 权限
kubectl apply -f dashboard-admin.yaml
ADMIN_SECRET=$(kubectl get secrets -n kubernetes-dashboard | grep dashboard-admin-token | awk '{print $1}')
DASHBOARD_LOGIN_TOKEN=$(kubectl get secret ${ADMIN_SECRET} -n kubernetes-dashboard -o jsonpath={.data.token} | base64 -d)
echo ${DASHBOARD_LOGIN_TOKEN}