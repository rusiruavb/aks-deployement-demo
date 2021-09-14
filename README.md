## Deploy Simple Node JS application into Azure Kubernetes Service

This repository contains a simple node js application that returns portfolio html page after application started.

#### Steps to get the project and run :desktop_computer:

1. :heavy_check_mark: Clone or fork the application. `git clone https://github.com/rusiruavb/aks-demo.git`
2. :heavy_check_mark: Open the application in VS Code or any other code editor `code .`
3. :heavy_check_mark: Run `npm install` to install necessary dependencies.
4. :heavy_check_mark: Run `npm run start` to run the application. The application will run on `http://localhost:8045` port.

#### Steps to create Docker image and run :whale:

1. :heavy_check_mark: Run `docker image build -t portfolio-app:v1`. (This will create Docker image. :package:)
2. :heavy_check_mark: Run `docker run -d -p 3000:8045 portfolio-app:v1` :rocket:
3. :heavy_check_mark: Open your browser and type `http://localhost:3000` and enter.

**All other commands to create Azure Container Registry(ACR) and Azure Kubernetes Service(AKS) are in the** `commands.sh` **file.**
