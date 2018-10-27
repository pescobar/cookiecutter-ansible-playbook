{{cookiecutter.playbook_name}}
=========

{{ cookiecutter.description }}


playbook Variables
--------------

A description of the settable variables for this playbook should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the playbook. Any variables that are read from other playbooks and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

A list of other playbooks hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other playbooks, or variables that are used from other playbooks.

Example Playbook
----------------

    - hosts: servers
      playbooks:
         - { playbook: {{ cookiecutter.playbook_name }}, var_name: 42 }

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the playbook should be mentioned here. For instance, if the playbook uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

License
-------

{{ cookiecutter.license }}

Author Information
------------------

{{ cookiecutter.author }}
