#!/bin/bash

ln -s molecule/default/requirements.yml
git init &> /dev/null
git add . &> /dev/null
pre-commit install &> /dev/null
git commit -a -m "Initial commit by cookiecutter" &> /dev/null

printf "Path to your new role in the local machine is `pwd` \n"
