#!/bin/bash

# this script queries the latest versions published in github for each ansible role
# and updates file "requirements.yml" to download the latest versions

query_latest_github_release () {
	github_repo=$1
	github_latest_release=$(curl -s https://api.github.com/repos/${github_repo}/releases/latest | grep tag_name | awk -F":" {'print $2'} | tr -d \",)
}

for repo in "robertdebock/ansible-role-bootstrap" \
	    "robertdebock/ansible-role-core_dependencies" \
	    "michaelrigart/ansible-role-interfaces" \
	    "robertdebock/ansible-role-cron" \
	    "robertdebock/ansible-role-ntp" \
	    "robertdebock/ansible-role-postfix" \
	    "willshersystems/ansible-sshd" \
	    "robertdebock/ansible-role-fail2ban" \
	    "robertdebock/ansible-role-users";
do 
	query_latest_github_release "$repo"
	sed -i -e "s#${repo}#${github_latest_release}#" requirements.yml
done
