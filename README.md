# gpdb-ansible

Ansible Roles to install Greenplum Database


## Roles

There are a few predefined roles, they can be selected in _install-host.yml_.

The makefile offers to install all prerequisites on a host - only use this functionality in a trusted network! It will accept any ssh key without asking for further confirmation!


## Instructions

Best start with this [Ansible base](https://github.com/andreasscherbaum/ansible-base) repository and link the _gpdb-ansible_ roles as new roles in the _roles/_ directory.

```
git clone https://github.com/andreasscherbaum/ansible-base greenplum-database
git clone https://github.com/geerlingguy/ansible-role-repo-epel.git greenplum-database/roles/epel
git clone https://github.com/andreasscherbaum/gpdb-ansible.git gpdb-ansible
for i in `cd gpdb-ansible/roles && ls`; do ln -s ../../gpdb-ansible/roles/$i greenplum-database/roles/$i; done

```


And add the new(s) role in _install-host.yml_, after the _common_ role:


```
---

- hosts: all
  become: yes
  roles:
    - common
    - gpdb4

```


Finally initialize the build host, using:

```
make install
```


## Configuration

The Greenplum Database version 4 information are in _roles/gpdb4/vars/main.yml_. Changing the version information will attempt an upgrade of the software. Always run a backup of your data first!
