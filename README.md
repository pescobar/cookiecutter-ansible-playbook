# Cookiecutter template for ansible playbooks

Template to initialize an ansible playbook

## Requirements

The template itself only needs python and cookicuter. Install it in a virtualenv if needed doing `pip install cookiecutter`

## What this template provides?

* Static yaml ansible [inventory]({{cookiecutter.playbook_name}}/inventory/hosts.yml) with examples
* [.yamllint]({{cookiecutter.playbook_name}}/.yamllint) config file for [yaml linter](https://github.com/adrienverge/yamllint)
* [.pre-commit-config.yaml]({{cookiecutter.playbook_name}}/.pre-commit-config.yaml) used by [pre-commit](http://pre-commit.com/)
* [.gitignore]({{cookiecutter.playbook_name}}/.gitignore) with common files I don't want to track in git
* [.ansible-lint]({{cookiecutter.playbook_name}}/.ansible-lint) config file for [ansible-lint](https://github.com/ansible/ansible-lint)
* [ansible.cfg]({{cookiecutter.playbook_name}}/ansible.cfg)
* [requirements.yml]({{cookiecutter.playbook_name}}/requirements.yml) with common roles I usually use
* [Vagrantfile]({{cookiecutter.playbook_name}}/Vagrantfile) which can be used to test/debug the playbook

**This template uses a [hook](hooks/post_gen_project.sh) to query latest versions of ansible roles and pre-commit repos and dynamically generate "requirements.yml" and ".pre-commit-config.yml using latest published versions**

## Usage

### To initialize a playbook

```
$ pip install cookiecutter
$ cookiecutter gh:pescobar/cookiecutter-ansible-playbook-molecule
```

## Files layout

```
ansible-playbook-webserver/
├── ansible.cfg
├── site.yml
├── inventory
│   ├── group_vars
│   │   └── all
│   ├── hosts.yml
│   └── host_vars
│       └── example_host
├── README.md
└── requirements.yml
```

## Running the playbook

Once you have configured your inventory and defined the required role variables in `inventory/group_vars` and `inventory/host_vars`:

### Configure every host in the inventory
```
$> ansible-playbook site.yml
```

### Configure a single host or group
```
$> ansible-playbook site.yml --limit compute02
```

## Workflow of the playbook

* Execute `tasks/common/pre.yml`
* Execute `tasks/host_pre/{{ inventory_hostname }}_pre.yml` (if any)
* Execute `tasks/custom_roles_by_host.yml` . *Roles in this file are selected based on inventory variables `local_apply_role_XXX`*
* Execute `tasks/host_post/{{ inventory_hostname }}_post.yml` (if any)
* Execute `tasks/common/post.yml`

## Customization of the hosts

Place any custom PRE task in `tasks/host_pre/{{ inventory_hostname }}_pre.yml` . This is executed BEFORE the roles
You can select which roles apply to the host defining variables `local_apply_role_XXX` in the inventory
Place any custom POST task in `tasks/host_post/{{ inventory_hostname }}_post.yml` . This is executed AFTER the roles

For each of the roles you apply to a host you must place the required role variables in `inventory/host_vars` or `inventory/group_vars`

## Testing the playbook with vagrant

* Edit `inventory/hosts.yml` and define the required `local_apply_role_XXX` var for the vagrant group to choose which roles to apply
* Create file `inventory/group_vars/vagrant` to define the required role vars
* `vagrant up`
* `vagrant provision`
