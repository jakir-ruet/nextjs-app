## Update inventory file `Inventory file (/etc/ansible/hosts)` for connectivity testing

```bash
[docker_host]
192.168.1.112 ansible_python_interpreter=/usr/bin/python3 # docker server ip
# localhost ansible_python_interpreter=/usr/bin/python3 # Mean ansible server
# Or
# [docker_host]
# 192.168.1.112 ansible_user=ansadmin ansible_ssh_private_key_file=~/.ssh/id_rsa
```

### Install Docker collection on `Ansible` server

```bash
ansible-galaxy collection install community.docker
```

### Run the playbook

```bash
ansible-playbook -i inventory.yaml deploy-nextjs-docker.yaml --ask-become-pass --check
ansible-playbook -i inventory.yaml deploy-nextjs-docker.yaml --ask-become-pass
```

### Check `Images`, `Container` and visit the application in `Docker` server

```bash
docker images
docker ps
docker ps -a
http://docker-server-ip:3000
```
