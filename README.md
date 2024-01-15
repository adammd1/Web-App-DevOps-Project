# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Contributors](#contributors)
- [License](#license)

## Features

- **Order List:** View a comprehensive list of orders including details like date UUID, user ID, card number, store code, product code, product quantity, order date, and shipping date.
  
![Screenshot 2023-08-31 at 15 48 48](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/3a3bae88-9224-4755-bf62-567beb7bf692)

- **Pagination:** Easily navigate through multiple pages of orders using the built-in pagination feature.
  
![Screenshot 2023-08-31 at 15 49 08](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/d92a045d-b568-4695-b2b9-986874b4ed5a)

- **Add New Order:** Fill out a user-friendly form to add new orders to the system with necessary information.
  
![Screenshot 2023-08-31 at 15 49 26](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/83236d79-6212-4fc3-afa3-3cee88354b1a)

- **Data Validation:** Ensure data accuracy and completeness with required fields, date restrictions, and card number validation.

## Getting Started

### Prerequisites

For the application to succesfully run, you need to install the following packages:

- flask (version 2.2.2)
- pyodbc (version 4.0.39)
- SQLAlchemy (version 2.0.21)
- werkzeug (version 2.2.3)

### Usage

To run the application, you simply need to run the `app.py` script in this repository. Once the application starts you should be able to access it locally at `http://127.0.0.1:5000`. Here you will be meet with the following two pages:

1. **Order List Page:** Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

2. **Add New Order Page:** Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.

## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.

# UPDATES

## Delivery Date Feature
This addition introduces the ability to track delivery dates. This feature was reverted and is no longer in use.

## Containerization with Docker

**Containerization Process**

Python 3.8-slim for Flask app, installed dependencies from requirements.txt, exposed port 5000, created startup command.

Build and run the image, pushed it to Docker Hub.

## Defining networking services & an AKS cluster with IaC

Created aks-terraform directory with two modules: networking-module , aks-cluster-module

-networking-module:

variables.tf: Defines the input variables for the networking module, these include resource_group_name, location and vnet_address_space.

main.tf: Configures the essential networking resources for the AKS cluster, Azure Resource Group, Virtual Network (VNet), Control Plane Subnet, Worker Node Subnet, and Network Security Group (NSG), and defines inbound rules within NSG

outputs.tf: Defines the output variables, vnet_id, control_plane_subnet_id, worker_node_subnet_id, networking_resource_group_name, aks_nsg_id

**Then initilaise from the networking-module: terraform init**

-aks-cluster-module:

variables.tf: Defines the input variables for the aks, aks_cluster_name, cluster_location, dns_prefix, kubernetes_version, service_principal_client_id, service_principal_secret

main.tf: Creates aks cluster, node pool and service principle.

outputs.tf: Defines the output variables, aks_cluster_name, aks_cluster_id, aks_kubeconfig

**Then initilaise from the aks-cluster-module: terraform init**

## Creating an AKS cluster with IaC

Create main.tf in aks-terraform directory and configure with client id, client secret, subscription id, tenant id

Integrate the networking module, input variables include resource_group_name, location, vnet_address_space

Integrate the cluster module, input variables include cluster_name, location, dns_prefix, kubernetes_version, service_principal_client_id, service_principal_secret

There are also other variables referencing output variables from the networking module for the other input variables required by the cluster, resource_group_name, vnet_id, control_plane_subnet_id, worker_node_subnet_id and aks_nsg_id

add necessary files to .gitignore file to protect sensitive information

## Kubernetes deployment to AKS

Defined a Kubernetes Deployment named flask-app-deployment, with high availability and 2 replicas. 

Utilise unique label app: flask-app , and specify container image and port 5000, implement rolling updates, add flask-app-service with internal communication on port 80 with ClusterIP service type.

**Deploying to AKS**

Apply kubernetes manifest 'kubectl apply -f application-manifest.yaml', monitor deployment feedback and verify the pods and services deployment status 

Test locally, use port forwarding 'kubectl port-forward <pod-name> 5000:5000', then access web applicaiton at http://127.0.0.1:5000

## CI/CD Pipeline with Azure DevOps

Create a project in Azure DevOps, assign email, configure github, use starter pipeline, set up service connection with personal access token, build and push Docker image.

Create AKS service connection, modify pipeline for kubernetes deployment and use deployment manifest. 

Monitor pods status and use port forwarding to test locally, verify deployment and application functionality.

## AKS Cluster Monitoring

Enable container insights

Monitor the metric charts:

Average Node CPU Usage
![image](https://github.com/adammd1/Web-App-DevOps-Project/assets/137420753/575e870a-44ce-403e-91cf-3e860421bab6)
Average Pod Count
![image](https://github.com/adammd1/Web-App-DevOps-Project/assets/137420753/a6e408df-8473-4f9e-81b8-7e0a3b1c2107)
Used Disk Percentage
![image](https://github.com/adammd1/Web-App-DevOps-Project/assets/137420753/0f5b148d-f058-4a19-a693-3462a7a530dd)
Bytes Read/Written per Second
![image](https://github.com/adammd1/Web-App-DevOps-Project/assets/137420753/179a6dd5-0915-4d0b-8b76-e5dac265704a)
## Screenshots
task 2:
![image](https://github.com/adammd1/Web-App-DevOps-Project/assets/137420753/575e870a-44ce-403e-91cf-3e860421bab6)
![image](https://github.com/adammd1/Web-App-DevOps-Project/assets/137420753/a6e408df-8473-4f9e-81b8-7e0a3b1c2107)
![image](https://github.com/adammd1/Web-App-DevOps-Project/assets/137420753/0f5b148d-f058-4a19-a693-3462a7a530dd)
![image](https://github.com/adammd1/Web-App-DevOps-Project/assets/137420753/179a6dd5-0915-4d0b-8b76-e5dac265704a)

task 3:
![image](https://github.com/adammd1/Web-App-DevOps-Project/assets/137420753/fed151d9-c8e4-45de-a03f-7c1dd0690e42)
![image](https://github.com/adammd1/Web-App-DevOps-Project/assets/137420753/df914b7e-7d51-459d-b07f-c0dac6e826bb)
![image](https://github.com/adammd1/Web-App-DevOps-Project/assets/137420753/cd00d367-cfb7-4a07-bbb8-25e647d2db1d)
![image](https://github.com/adammd1/Web-App-DevOps-Project/assets/137420753/0237714b-879e-4df9-a2a1-c581a02dbe83)
![image](https://github.com/adammd1/Web-App-DevOps-Project/assets/137420753/561624c2-7c7f-4d5b-906e-235adb0c56f6)









