# jripper-terraform-ansible
Build JRipper project using Terraform and Ansible

## Learning outcomes
1. Further real-world applications of Terraform
    - using remote-exec to hold execution until an instance is up
    - using local-exec to update an Ansible playbook with a Terraform variable
    - calling Ansible to do config management/build in this case
1. Further real-world applications of Ansible
    - debugging Ansible, both real-time and as part of play
    - calling a bunch of providers - apt, lineinfile, file, cron, pip, template, service
    - handling variables to chain output
    - handling privilege escalation
    - defining my own changed_when conditions to quash unnecessary noise
1. Explored why chaining together ansible, git and terraform is a bad idea
    - increased fragility
    - loss of visibility
    - harder to debug
    - longer to execute/harder to step through
