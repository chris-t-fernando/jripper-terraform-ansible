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

## todo
1. Accelerated execution
    - It's slow because each task is a new ssh login
    - Can't use pipelining because the play requires privilege escalation
    - Couldn't work out multiplexing - config file was set but ansible-config dump ignored it, even though ansible-config view showed my configuration settings
    - In a real-world environment, forking would probably deal with it, depending on the ansible server's dimensions.  Guess 5 minute execution per box isn't that bad, but seems crazy noisy/wasteful

## Good reading
1. https://max.engineer/six-ansible-practices
1. https://www.digitalocean.com/community/tutorials/how-to-use-ansible-to-install-and-set-up-apache-on-ubuntu-18-04
1. https://alex.dzyoba.com/blog/terraform-ansible/
