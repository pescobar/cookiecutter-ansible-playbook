# Cookiecutter template for ansible playbooks

Template for ansible playbook with [molecule](https://molecule.readthedocs.io/en/latest/) testing

## Requirements

The template itself only needs python and cookicuter. Install it in a virtualenv if needed doing `pip install cookiecutter`

## What this template provides?

* Initialize a new git repo in the local machine
* Add [.yamllint](https://github.com/adrienverge/yamllint) config file (used by molecule)
* Add .pre-commit-config.yaml used by [pre-commit](http://pre-commit.com/)
* Add .gitignore with common files I don't want to track in git
* Add the default configuration file for [Molecule](http://molecule.readthedocs.io) in the "molecule" folder
  * The molecule config will include two scenarios (default scenario uses Vagrant, docker scenario uses docker)
  * The default scenario (Vagrant) will test CentOS7
  * The molecule playbooks are configured to run as root in the test instances
  * molecule runs [testinfra](https://testinfra.readthedocs.io) in verbose mode
* And probably something else that I forget... :)

## Usage

```
$ pip install cookiecutter
$ cookiecutter gh:pescobar/cookiecutter-ansible-playbook-molecule
```
