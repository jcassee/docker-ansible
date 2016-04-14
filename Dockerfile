FROM ubuntu:14.04

MAINTAINER Go About <tech@goabout.com>

# Install Ansible and Python packages used by modules and plugins
RUN apt-get install -yq software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update -q && \
    apt-get install -yq ansible python-pip python-pyasn1 python-openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN pip install "github3.py==1.0.0a4"

WORKDIR /ansible

ENV ANSIBLE_PLAYBOOK site.yml

CMD ["sh", "-c", "ansible-playbook \"$ANSIBLE_PLAYBOOK\""]
