# Cookiecutter template for ansible playbooks

Template to initialize an ansible playbook

## Requirements

To initialize the template you need git, curl and cookicuter (pip install cookiecutter)

## What this template provides?

* Ansible [inventory]({{cookiecutter.playbook_name}}/inventory/hosts) with examples
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
$ cookiecutter https://github.com/pescobar/cookiecutter-ansible-playbook.git
$ cd playbook_dir/
$ ansible-galaxy role install -r requirements.yml -p ./roles/

Optional:

$ pip install pre-commit
$ cd playbook_dir/
$ git init
$ pre-commit install
```

## Files layout

```
ansible-playbook/
├── ansible.cfg
├── inventory
│   ├── group_vars
│   │   └── all
│   ├── hosts.yml
│   └── host_vars
│       └── example_host
├── README.md
├── requirements.yml
├── site.yml
├── tasks
│   ├── common
│   │   ├── post.yml
│   │   └── pre.yml
│   ├── custom_roles_by_host.yml
│   ├── groups
│   │   └── README.txt
│   └── hosts
│       └── README.txt
└── Vagrantfile
```

## Workflow of the playbook

* Execute `tasks/common/pre.yml`
* Execute `tasks/hosts/{{ inventory_hostname }}_pre.yml` (if any)
* Execute `tasks/groups/{{ group_name }}.yml` (if any)
* Execute `tasks/hosts/{{ inventory_hostname }}_post.yml` (if any)
* Execute `tasks/common/post.yml`

## Executing the playbook

### Setting up the inventory and role variables

* Edit [inventory/hosts]({{cookiecutter.playbook_name}}/inventory/hosts) to define your hosts and groups.

* Edit `tasks/common/pre.yml` and `tasks/common/post.yml` with the list of tasks that will apply to every host.

* To do host-level customization add the required tasks to:
  * `tasks/hosts/{{ inventory_hostname }}_pre.yml`
  * `tasks/hosts/{{ inventory_hostname }}_post.yml` 

* To do group-level customizations add the required tasks to `tasks/groups/{{ group_name }}.yml` and import them from `site.yml`

* Define the required **role variables** in folders `inventory/group_vars` and `inventory/host_vars`

**Inventory file `inventory/hosts` should only include [behavioral vars](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html#connecting-to-hosts-behavioral-inventory-parameters)**

**All the role vars should be defined in `inventory/host_vars` or `inventory/group_vars`**

### Apply the playbook to every host in the inventory
```
$> ansible-playbook site.yml
```

### Apply the playbook to a single host or group
```
$> ansible-playbook site.yml --limit compute02
```


## Customization of the hosts and groups

* Place any custom PRE HOST SPECIFIC task in `tasks/hosts/{{ inventory_hostname }}_pre.yml`
* Place any GROUP SPECIFIC tasksk in `tasks/groups/{{ group_name }}.yml` and import it from `site.yml`
* Place any custom POST HOST SPECIFIC  task in `tasks/hosts/{{ inventory_hostname }}_post.yml`

## Testing the playbook with vagrant

* Edit `inventory/hosts`
* Create file `inventory/group_vars/vagrant` to define the required role vars
* `vagrant up`
* `vagrant provision`
