## Inventory file `Inventory file (/etc/ansible/hosts)`

```bash
[docker_host]
192.168.1.112 ansible_python_interpreter=/usr/bin/python3 # docker server ip
# localhost ansible_python_interpreter=/usr/bin/python3 # Mean ansible server
# Or
# [docker_host]
# 192.168.1.112 ansible_user=ansadmin ansible_ssh_private_key_file=~/.ssh/id_rsa
```

### Install Docker collection

```bash
ansible-galaxy collection install community.docker
```

### Run the playbook

```bash
ansible-playbook deploy-nextjs-docker.yaml --check
ansible-playbook deploy-nextjs-docker.yaml
ansible-playbook -i inventory.yaml deploy-nextjs-docker.yaml

```
