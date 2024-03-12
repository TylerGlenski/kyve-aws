##### Needs optimizing, for now its a bunch of hacks and runs to get it working. TODO: imporve this dockerfile

FROM ubuntu:20.04

ENV TZ=America/Chicago \
  DEBIAN_FRONTEND=noninteractive


# Install APT DEPS
RUN apt-get update && \
    apt install -y sudo \
    nano \
    gpg \
    wget \
    curl \
    software-properties-common \
    gnupg \
    python3-pip

# Install pip packages
RUN pip3 install pexpect

# ansible install
RUN wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu focal main" | tee /etc/apt/sources.list.d/ansible.list
RUN apt-get update && \
  apt install -y ansible

# Create an SSH user
RUN useradd -rm -d /home/ansible_user -s /bin/bash -g root -G sudo -u 1000 ansible_user
RUN echo 'ansible_user:password' | chpasswd
RUN mkdir /home/ansible_user/.ssh
RUN chown ansible_user: /home/ansible_user/.ssh
RUN chmod 700 /home/ansible_user/.ssh

# copy in files
COPY . .

# RUN ssh-keygen -t ed25519 -a 150 -C "ansible.user@fake.com" -f /home/ansible_user/.ssh/ansible-ssh -q -N ""


COPY ./ansible-ssh /home/ansible_user/.ssh
COPY ./ansible-ssh.pub /home/ansible_user/.ssh

# assign permissions for ssh priv key
RUN chmod 600 /home/ansible_user/.ssh/ansible-ssh

# setup ansible_vault.key
RUN echo $(openssl rand -base64 12) > ansible_vault.key
RUN chmod 600 ansible_vault.key

# export ssh env vars
ENV ANSIBLE_PRIVATE_KEY_FILE=/home/ansible_user/.ssh/ansible-ssh
ENV ANSIBLE_REMOTE_USER=ubuntu

RUN ls -la
RUN chmod +x ./ansible/install_roles.sh && ./ansible/install_roles.sh


## Install Terraform
RUN wget -O- https://apt.releases.hashicorp.com/gpg | \
  gpg --dearmor | \
  sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

RUN gpg --no-default-keyring \
  --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
  --fingerprint

RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
  https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
  tee /etc/apt/sources.list.d/hashicorp.list

RUN apt update

RUN apt-get install terraform -y

COPY ./terraform /terraform

RUN apt-get install unzip -y
# install awscli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

ARG AWS_SECRET_KEY
ARG AWS_ACCESS_KEY
ARG AWS_DEFAULT_REGION

ENV AWS_ACCESS_KEY=$AWS_ACCESS_KEY
ENV AWS_SECRET_KEY=$AWS_SECRET_KEY
ENV AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION

# Start SSH server on container startup
CMD ["tail", "-f", "/dev/null"]