FROM ubuntu:14.04

MAINTAINER Go About <tech@goabout.com>

# Install Ansible 2 from a PPA when it is released. For now, build it ourselves.

RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq \
        python \
        python-crypto \
        python-httplib2 \
        python-jinja2 \
        python-paramiko \
        python-passlib \
        python-six \
        python-support \
        python-yaml \
        sshpass \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ansible_*.deb /tmp/
RUN DEBIAN_FRONTEND=noninteractive dpkg -i /tmp/ansible_*.deb && \
    rm /tmp/ansible_*.deb

WORKDIR /ansible

ENV ANSIBLE_PLAYBOOK site.yml

CMD ["bash", "-c", "ansible-playbook \"$ANSIBLE_PLAYBOOK\""]
