# Cookiecutter template for ansible playbooks

Template to initialize an ansible playbook

## Requirements

The template itself only needs python and cookicuter. Install it in a virtualenv if needed doing `pip install cookiecutter`

## What this template provides?

* Static ansible [inventory]({{cookiecutter.playbook_name}}/inventory/hosts) with examples
* [.yamllint]({{cookiecutter.playbook_name}}/.yamllint) config file for [yaml linter](https://github.com/adrienverge/yamllint)
* [.pre-commit-config.yaml]({{cookiecutter.playbook_name}}/.pre-commit-config.yaml) used by [pre-commit](http://pre-commit.com/)
* [.gitignore]({{cookiecutter.playbook_name}}/.gitignore) with common files I don't want to track in git
* [.ansible-lint]({{cookiecutter.playbook_name}}/.ansible-lint) config file for [ansible-lint](https://github.com/ansible/ansible-lint)
* [ansible.cfg]({{cookiecutter.playbook_name}}/ansible.cfg)
* [requirements.yml]({{cookiecutter.playbook_name}}/requirements.yml) with common roles I usually use

**This template uses a hook to query latest versions of ansible roles and pre-commit hooks to dynamically generate "requirements.yml" and ".pre-commit-config.yml using latest published versions**

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
├── ansible-playbook-webserver.yml
├── inventory
│   ├── group_vars
│   │   └── all
│   ├── hosts
│   └── host_vars
│       └── example_host
├── README.md
└── requirements.yml
```
