# HOST specific customization tasks

# Files in this folder should be named: "{{ inventory_hostname }}_pre.yml" or "{ inventory_hostname }}_post.yml" 

# Execution flow in "site.yml" is:
# tasks/common/pre.yml
# tasks/hosts/{ inventory_hostname }}_pre.yml (if any)
# tasks/groups/group_A.yml (if any)
# tasks/groups/group_B.yml (if any)
# tasks/hosts/{ inventory_hostname }}_post.yml (if any)
# tasks/common/post.eyml
