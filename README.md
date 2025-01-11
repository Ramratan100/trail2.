# SQL Tool for Hosting a Shopping Website  

## Overview  
This project demonstrates a practical setup for hosting a fully functional shopping website. It uses modern DevOps practices to automate the infrastructure provisioning, server configuration, and deployment process. The setup integrates tools such as *Terraform, **Ansible, **GitHub, **Jenkins, **Apache, **PHP, and **MySQL* to deliver a scalable and production-ready solution.  

## Architecture  
The project is deployed on AWS with the following components:  
- *Two EC2 Ubuntu Instances*:  
  - *Private Instance*: Hosts the MySQL database.  
  - *Public Instance*: Hosts the shopping website using Apache and PHP.  
- *Infrastructure*: Managed using Terraform, including VPCs, subnets, and security groups for secure communication.  
- *CI/CD Pipeline*: Configured using Jenkins for automated deployment.  

## Features  
- Automated provisioning of AWS resources using Terraform.  
- Installation and configuration of MySQL, Apache, and PHP using Ansible.  
- Secure database communication between private and public instances.  
- Continuous integration and deployment using Jenkins.  
- Centralized version control with GitHub.  

## Prerequisites  
Before running this project, ensure you have the following installed:  
- Terraform  
- Ansible  
- Jenkins  
- AWS CLI configured with appropriate access keys  
- Git  
