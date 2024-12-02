## BeStrong API Deployment to AKS with Helm and Azure DevOps

This repository demonstrates the complete workflow for deploying the BeStrong API to an Azure Kubernetes Service (AKS) cluster using Helm, with CI/CD pipelines managed by Azure DevOps. The deployment ensures the API is accessible via HTTPS and runs two instances simultaneously, with traffic balanced across them.

## 📖 Table of Contents

## 📝 Introduction

## ✨ Features

Automated deployment of BeStrong API to AKS.
- Secure HTTPS access using cert-manager with Let's Encrypt or self-signed certificates.
- Scalable deployment with two instances running simultaneously.
- Helm chart packaging, versioning, and storage in Azure Container Registry (ACR).
CI/CD pipelines for build and deployment via Azure DevOps.

## ✅ Prerequisites
Before starting, ensure you have the following:
1. Azure Account: To create and manage AKS and ACR.
2. Kubernetes Tools:
- kubectl
- Helm
3. Azure CLI: Install Azure CLI
4. Azure DevOps Account: To create pipelines.
5. Domain Name (optional): For HTTPS with Let's Encrypt.

## 🛠 Testing
1. API Availability:
```bash
curl https://bestrong.example.com
```

2. Load Balancing:
```bash
kubectl logs <pod-name>
```

## 🚀 Setup Guide

## Step 1:Create an AKS Cluster
1. Use Terraform to create an AKS cluster. Refer to the repository's Terraform folder for configurations.
```bash
terraform init
terraform apply
```
2. Connect to the cluster:
```bash
az aks get-credentials --resource-group <resource-group-name> --name <aks-cluster-name>
```

## Step 2: Configure Helm Charts
1. Clone this repository and navigate to the helm/bestrong directory.

2. Customize values.yaml for your deployment:
```bash
replicaCount: 2
ingress:
  hostname: "bestrong.example.com"
  tlsSecret: "bestrong-tls"
certManager:
  issuer: "letsencrypt-prod"  # Use "selfsigned-issuer" for self-signed certificates
```
3. Package the Helm chart:
```bash
helm package .
helm install bestrong ./bestrong
```
## Step 3: Enable HTTPS with cert-manager
1. Install cert-manager in your AKS cluster
```bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/latest/download/cert-manager.yaml
```
2. Create a ClusterIssuer:
```bash
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
spec:
  acme:
    server: https://acme-v02.api.letsencrypt.org/directory
    email: your-email@example.com
    privateKeySecretRef:
      name: letsencrypt-prod
    solvers:
    - http01:
        ingress:
          class: nginx
```
Apply it:
```bash
kubectl apply -f clusterissuer.yaml
```

## Step 4: Azure DevOps CI/CD Pipeline
1. Create a new Azure DevOps project and link this repository.
2. Add the azure-pipelines.yml file from this repository to set up the pipeline.
3. Configure Azure service connections for AKS and ACR.
4. Run the pipeline to package and deploy the Helm charts automatically.

## Step 5: Run Two Instances with Load Balancing
1. Verify that two pods are running:
```bash
kubectl get pods
```
2. Check the external IP of the service:
```bash
kubectl get service bestrong
```
3. Access the API through the external IP or hostname specified in the ingress.

## ❓ FAQ
Q: What if I don’t have a domain?
A: Use the selfsigned-issuer with a self-signed certificate for HTTPS.

Q: How can I scale the application further?


## 📜 License

This project is licensed under the MIT License. See the LICENSE file for details.
A: Update replicaCount in values.yaml and re-deploy the Helm chart:
```bash
   helm upgrade bestrong ./bestrong --values values.yaml
```

## 🤝 Contributing

We welcome contributions! Feel free to open issues or submit pull requests to improve this repository.