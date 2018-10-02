ETCD
=====================

This role can be used for deploying `etcd` clusters. It is based on the following guide: [Kubernetes HA guide](https://github.com/kubernetes/website/blob/1998ab735fac0d8ba9063bc3e3009a828e5bb83f/content/en/docs/setup/independent/high-availability.md)

Requirements
------------

* Ansible >= 2.5.4

Role Variables
--------------
| Variables | Description | Default |
|-----------|-------------|---------|
| etcd_inventory_group | ETCD group in ansible inventory file | "etcd" |
| etcd_cluster_type | External cluster (systemd) or hosted cluster inside k8s masters (docker) | "systemd" |
| etcd_version | Etcd version | "v3.1.10" |
| etcd_interface | Network interface to use | "eth0" |
| etcd_ssh_key_generated | Generate ssh key or not | False |
| etcd_tls_enabled | Disable or enable TLS | True |
| etcd_cert_org_name | Certificat organization name | "your-company.com" |
| etcd_host_cert_dir | Certificat folder on host machine | "/etc/etcd/certs" |
| etcd_host_data_dir | Etcd data folder on host machine | "/data/etcd" |
| etcd_initial_cluster_token | Initial token | "my-etcd-token" |
| etcd_initial_cluster_state | Initial state | "new" |

Dependencies
------------

N/A

Example Playbook
----------------

```yaml
- name: Install etcd
  hosts: "etcd"
  user: root
  become: yes
  roles:
    - { role: ansible-etcd }
  vars:
    etcd_interface: "eth1"
    etcd_host_cert_dir: "/etc/kubernetes/pki/etcd"
    etcd_ssh_key_generated: True
    etcd_inventory_group: "etcd"
  tags:
    - etcd-install
```

Inventory file exemple
----------------------

No special variable necesary in inventory file for this role.

Tests
-----

**Requirements:**
- Vargant
- Virtualbox

**Description:**

For testing the role, you can use the script test.sh in the test folder. It will do the following steps:
- Start 3 VMs within Vagrant and set them up as a 3-node ETCD cluster
- Launch the playbook `test.yml`
	- Get cluster health with status of each member
	- Check member's health with the expected ones
- Destroy all VMs

Contributors
------------

* Thanh NGUYEN <u.nguyenthanh@gmail.com>
