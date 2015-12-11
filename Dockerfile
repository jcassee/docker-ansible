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
        python-six \
        python-support \
        python-yaml \
        sshpass \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ansible_2.0.0-0.git201512071813.cc98528.stable20~unstable_all.deb /tmp/
RUN DEBIAN_FRONTEND=noninteractive dpkg -i /tmp/ansible_2.0.0-0.git201512071813.cc98528.stable20~unstable_all.deb && \
    rm /tmp/ansible_2.0.0-0.git201512071813.cc98528.stable20~unstable_all.deb

WORKDIR /ansible

ENV ANSIBLE_PLAYBOOK site.yml

CMD ansible-playbook "$ANSIBLE_PLAYBOOK"
