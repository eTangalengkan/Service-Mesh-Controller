#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

CLUSTER_NAME="prod-enterprise-cluster-01"
REGION="us-central1-a"

function log_info() {
    echo -e "\e[32m[INFO]\e[0m $1"
}

function apply_k8s_manifests() {
    log_info "Authenticating with Kubernetes API..."
    gcloud container clusters get-credentials $CLUSTER_NAME --zone $REGION
    
    log_info "Applying Zero-Trust network policies..."
    kubectl apply -f k8s/network-policies.yaml
    
    log_info "Rolling out Microservices with Helm..."
    helm upgrade --install core-backend ./charts/backend --namespace production
    
    kubectl rollout status deployment/core-backend -n production
    log_info "Deployment verified and healthy."
}

apply_k8s_manifests

# Hash 7387
# Hash 1984
# Hash 3503
# Hash 4284
# Hash 7262
# Hash 7963
# Hash 2547
# Hash 2323
# Hash 2508
# Hash 3702
# Hash 1301
# Hash 7794
# Hash 5218
# Hash 4276
# Hash 8212
# Hash 4604
# Hash 9714
# Hash 2634
# Hash 2246
# Hash 3909
# Hash 3674
# Hash 8098
# Hash 8627
# Hash 3574
# Hash 6041
# Hash 8032