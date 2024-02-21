
# TDengine Infrastructure Automation

This repository contains Terraform and Ansible scripts for provisioning and managing a TDengine cluster. It automates the setup of infrastructure on AWS, configuration of TDengine nodes, database creation, and implementation of a backup policy.

## Overview

The project is structured as follows:

- **Terraform**: Provisions the AWS infrastructure and outputs the public IPs of the created instances.
- **Ansible**: Configures the TDengine cluster using the provisioned instances and implements a backup policy.

## Prerequisites

- AWS Account
- Terraform installed
- Ansible installed

## Usage

### Step 1: Provision Infrastructure with Terraform


Initialize Terraform:

```bash
terraform init
```

Apply the Terraform plan to provision the infrastructure:

```bash
terraform apply
```

After applying, Terraform create a `hosts.ini` file with the public IPs as follows:

```ini
[tdengine_cluster]
node1 ansible_host=<Public_IP_of_Node1>  ansible_user=ubuntu
node2 ansible_host=<Public_IP_of_Node2> ansible_user=ubuntu
...
```

### Step 3: Run the TDengine Installation Playbook

Run the installation playbook:

```bash
ansible-playbook -i hosts.ini install_tdengine.yaml
```

### Step 4: Create Database Manually

Log into any of the TDengine nodes and create the database:

```bash
taos -h <node1_IP>
create database mydb;
```

### Step 5: Implement Backup Policy

Run the backup playbook to configure the backup policy:

```bash
ansible-playbook -i hosts.ini backup_tdengine.yaml
```

## Backup Policy

The `backup_tdengine.yaml` playbook configures a daily backup policy, storing backups in a specified S3 bucket. Ensure you have the S3 bucket details and necessary IAM permissions set up.