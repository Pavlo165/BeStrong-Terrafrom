## BeStrong API Deployment to AKS with Helm and Azure DevOps

This repository demonstrates the complete workflow for deploying the BeStrong API to an Azure Kubernetes Service (AKS) cluster using Helm, with CI/CD pipelines managed by Azure DevOps. The deployment ensures the API is accessible via HTTPS and runs two instances simultaneously, with traffic balanced across them.

## 📖 Table of Contents

## 📝 Introduction

## ✨ Features

Automated deployment of BeStrong API to AKS.
Secure HTTPS access using cert-manager with Let's Encrypt or self-signed certificates.
Scalable deployment with two instances running simultaneously.
Helm chart packaging, versioning, and storage in Azure Container Registry (ACR).
CI/CD pipelines for build and deployment via Azure DevOps.

## ✅ Prerequisites

## 🛠 Testing
1.API Availability:
```bash
curl https://bestrong.example.com
```

2.Load Balancing:
```bash
kubectl logs <pod-name>
```

## 🚀 Setup Guide

Step 1:Create an AKS Cluster
1.Use Terraform to create an AKS cluster. Refer to the repository's Terraform folder for configurations.
```bash
terraform init
terraform apply
```
2.Connect to the cluster:
```bash
az aks get-credentials --resource-group <resource-group-name> --name <aks-cluster-name>
```

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