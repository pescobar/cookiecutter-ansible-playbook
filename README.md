# Cookiecutter template for ansible playbooks

Template to initialize an ansible playbook

## Requirements

The template itself only needs python and cookicuter. Install it in a virtualenv if needed doing `pip install cookiecutter`

## What this template provides?

* Adds a default inventory with examples
* Add [.yamllint](https://github.com/adrienverge/yamllint) config file 
* Add .pre-commit-config.yaml used by [pre-commit](http://pre-commit.com/)
* Add .gitignore with common files I don't want to track in git
* Add .ansible-lint config
* Add an up-to-date requirements.yml with common roles I usually use
* Add and ansible.cfg
* And probably something else that I forget... :)

## Usage

### To initialize a playbook
```
$ pip install cookiecutter
$ cookiecutter gh:pescobar/cookiecutter-ansible-playbook-molecule
```

## Files layout
```
ansible-playbook-test/
├── ansible.cfg
├── ansible-playbook-test.yml
├── inventory
│   ├── group_vars
│   │   └── all
│   └── host_vars
│       └── example_host
├── README.md
└── requirements.yml
```
