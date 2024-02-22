# 🚀 TDengine Cloud Setup Simplified

**Boost your TDengine with our Terraform & Ansible toolkit.** This repo arms developers with powerful scripts to:

- **Provision AWS Infrastructure**: Deploy your architecture effortlessly.
- **Enable S3 Storage**: Securely store data with AWS S3 integration.
- **Fine-Tune Clusters**: Customize TDengine settings for optimal performance.
- **Manage Backups**: Automate your backup strategy with precision.

## Prerequisites

- AWS Account
- Terraform installed
- Ansible installed

## Usage

### Step 1: Provision Infrastructure with Terraform

Navigate to terraform directory:

``` bash
cd terraform
```

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

### Step 2: Run the TDengine Installation Playbook

Navigate to ansible directory:

``` bash
cd ../ansible
```

Run the installation playbook:

```bash
ansible-playbook -i hosts.ini install_tdengine.yaml
```

### Step 3: Create Database Manually

Log into any of the TDengine nodes and create the database:

```bash
taos -h <node1_IP>
create database mydb;
```

### Step 4: Implement Backup Policy

Run the backup playbook to configure the backup policy:

```bash
ansible-playbook -i hosts.ini backup_tdengine.yaml
```

### Step 5: Implement Backup Schedular

Modify `setup_cron.sh` based on the requirements then run:

```bash
chmod +x setup_cron.sh
./setup_cron.sh
```

Powered by [terraform-ai](https://github.com/jigsaw373/terraform-ai).
