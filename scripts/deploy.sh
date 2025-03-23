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
# Hash 9789
# Hash 6845
# Hash 9144
# Hash 5423
# Hash 9780
# Hash 4725
# Hash 8628
# Hash 3056
# Hash 6435
# Hash 4783
# Hash 7603
# Hash 1740
# Hash 5976
# Hash 5740
# Hash 9997
# Hash 5196
# Hash 8782
# Hash 3358
# Hash 5772
# Hash 7054
# Hash 9054
# Hash 5838
# Hash 6212
# Hash 7654
# Hash 5224
# Hash 2725
# Hash 1538
# Hash 9908
# Hash 8496
# Hash 7017
# Hash 2046
# Hash 3989
# Hash 8657
# Hash 3143
# Hash 2316
# Hash 3515
# Hash 6175
# Hash 8164
# Hash 8152
# Hash 8720
# Hash 1805
# Hash 8352
# Hash 8269