# Login to Azure
az login

# Get subscription ID
az account show --query id --output tsv
az account set -s "b6ed6993-9aab-44cc-a64f-8344a0e5e5b7"

# Create Azure Resource Group
az group create --name aks-demo --location southeastasia

--name —> Resource Group name
--location —> Azure region

# Create Azure Container Registry
az acr create --name "acrdemosample" -g "aks-demo" --location "southeastasia" --sku "Basic"

--name —> Name of the Azure Container Registry
-g —> Resource Group Name
--location —> Azure region ACR created
--sku —> Pricing tier for ACR

# Creating Azure Kubernetes Cluster
az aks create --resource-group aks-demo --name aks-demo \
--node-count 2 --generate-ssh-keys --node-vm-size=Standard_B2s \
--attach-acr acrdemosample

--resource-group —> Resource Group name
--name —> Name of the cluster
--node-count —> Number of worker nodes to create
--generate-ssh-keys —> This will automatically create a SSH keys for worker nodes
--node-vm-size —> Supported VM size to use for worker nodes
--attach-acr —> Attach existing Azure Container Registry

# Verify the Cluster Deployment
az aks get-credentials --resource-group aks-demo --name aks-demo
kubectl get nodes

# Building Docker Container Image
docker image build -t aksdemosample.azurecr.io/sample-app:v1 .

# Push Container Image to ACR
docker login aksdemosample.azurecr.io
docker image push aksdemosample.azurecr.io/sample-app:v1

# Deploye docker image to AKS cluster
kubectl apply -f aks.yml

# Check pods
kubectl get pods -w

# Check services
kubectl get service 

# Delete the resource group
az group delete --name aks-demo