#!/bin/bash

# this script queries the latest versions published in github for each ansible role
# and updates file "requirements.yml" to download the latest versions

query_latest_github_release () {
	github_repo=$1
	#github_latest_release=$(curl -s https://api.github.com/repos/${github_repo}/releases/latest | grep tag_name | awk -F":" {'print $2'} | tr -d " "\",)
	# line above fails because some repos don't provide releases when querying the github api so I assume last tag in master is latest release
	github_latest_release=$(curl -s https://api.github.com/repos/${github_repo}/tags | grep name | head -1 | awk '{print $2}' |sed -e 's/^"//' -e 's/",//')
}

for repo in "robertdebock/ansible-role-bootstrap" \
	    "robertdebock/ansible-role-core_dependencies" \
	    "michaelrigart/ansible-role-interfaces" \
	    "geerlingguy/ansible-role-firewall" \
	    "robertdebock/ansible-role-cron" \
	    "robertdebock/ansible-role-ntp" \
	    "robertdebock/ansible-role-postfix" \
	    "willshersystems/ansible-sshd" \
	    "robertdebock/ansible-role-fail2ban" \
	    "robertdebock/ansible-role-rsyslog" \
	    "0x0I/ansible-role-systemd" \
	    "AerisCloud/ansible-disk" \
	    "geerlingguy/ansible-role-postgresql" \
	    "ome/ansible-role-nfs-mount" \
	    "mrlesmithjr/ansible-netplan" \
	    "pescobar/ansible-role-selinux-disable" \
	    "wcm-io-devops/ansible-role-apache" \
	    "pescobar/ansible-role-dehydrated" \
	    "robertdebock/ansible-role-users";
do 
	query_latest_github_release "$repo"
	sed -i -e "s#${repo}#${github_latest_release}#" requirements.yml
done

query_latest_github_release "pre-commit/pre-commit-hooks"
sed -i -e "s#pre-commit-hooks-version#${github_latest_release}#" .pre-commit-config.yaml

query_latest_github_release "pre-commit/mirrors-autopep8"
sed -i -e "s#mirrors-autopep8-version#${github_latest_release}#" .pre-commit-config.yaml

query_latest_github_release "ansible/ansible-lint"
sed -i -e "s#ansible-lint-version#${github_latest_release}#" .pre-commit-config.yaml
