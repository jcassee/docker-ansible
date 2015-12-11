Docker Ansible image
====================

This project contains a Docker image for running Ansible 2.0 on Ubuntu 14.04.


## Usage

Mount the directory containing your playbooks at `/ansible`. By default, the
container will run the `site.yml` playbook. This can be changed using the
`ANSIBLE_PLAYBOOK` environment variable.

    docker run -v $PWD:/ansible:ro -e ANSIBLE_PLAYBOOK=playbook.yml goabout/ansible
