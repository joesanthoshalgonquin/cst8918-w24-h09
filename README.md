# CST8919 Hybrid 09

## Use Terraform to create an Azure Kubernetes Service (AKS) cluster
- Deployment successful
![plot](./screenshots/aks_deployment-terraform-success.png)

- Cluster is in Azure Portal
![plot](./screenshots/azure-portal-aks.png)

- Able to connect to the aks cluster
![plot](./screenshots/kubectl-get-nodes.png)

## Deploy a sample application to the AKS cluster.
- Deployed app to cluster (Deleted and re-did it to show screenshot because I cleared terminal after first deploy)
![plot](./screenshots/deploy_app_to_cluster.png)

- Verify app is running
![plot](./screenshots/verify_app_runs.png)

- Verify in browser that application is running using the external ip of store-front service
![plot](./screenshots/app_running_in_browser.png)
