# GROUP specific customization tasks for groups defined in the inventory

# Files in this folder should be named: "group_name.yml" and are imported from "site.yml" like this:
# - name: Custom setup for machines in group webservers
#   import_tasks: tasks/group/group_webservers.yml
#   when: "'webservers' in group_names"

# Execution flow in site.yml is:
# tasks/common/pre.yml
# tasks/hosts/{ inventory_hostname }}_pre.yml (if any)
# tasks/groups/group_A.yml (if any)
# tasks/groups/group_B.yml (if any)
# tasks/hosts/{ inventory_hostname }}_post.yml (if any)
# tasks/common/post.yml
