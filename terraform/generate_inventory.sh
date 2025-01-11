#!/bin/bash

# Define the AWS region
AWS_REGION="ap-northeast-1"

# Generate dynamic inventory for Ansible

# Fetch the bastion host public IP
BASTION_IP=$(aws ec2 describe-instances \
  --region $AWS_REGION \
  --filters "Name=tag:Name,Values=Bastion-Host" \
  --query 'Reservations[].Instances[].PublicIpAddress' \
  --output text)

# Fetch the MySQL instance private IP
MYSQL_IP=$(aws ec2 describe-instances \
  --region $AWS_REGION \
  --filters "Name=tag:Name,Values=MySQL-Instance" \
  --query 'Reservations[].Instances[].PrivateIpAddress' \
  --output text)

# Check if both IPs were fetched successfully
if [[ -z "$BASTION_IP" || -z "$MYSQL_IP" ]]; then
  echo "Error: Unable to fetch IP addresses. Ensure the instances are tagged correctly and AWS CLI is configured."
  exit 1
fi

# Write to the inventory file
cat <<EOL > ../ansible/inventory.yml
all:
  children:
    bastion:
      hosts:
        bastion_host:
          ansible_host: $BASTION_IP
          ansible_user: ubuntu
          ansible_ssh_private_key_file: /var/lib/jenkins/tokyojenkins.pem
    mysql:
      hosts:
        mysql_instance:
          ansible_host: $MYSQL_IP
          ansible_user: ubuntu
          ansible_ssh_private_key_file: /var/lib/jenkins/tokyojenkins.pem
EOL

echo "Inventory file generated successfully at ../ansible/inventory.yml"
