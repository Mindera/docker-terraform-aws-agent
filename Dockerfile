FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y ca-certificates wget gnupg unzip

# Install AWS CLI
ARG AWS_VERSION="2.0.37"
RUN wget -q https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_VERSION}.zip -O /tmp/awscliv2.zip && \
    unzip /tmp/awscliv2.zip -d /tmp && \
    /tmp/aws/install && \
    rm -rf /tmp/aws /tmp/awscliv2.zip

# Install Terraform
ARG TERRAFORM_VERSION="0.12.29"
RUN wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -O /tmp/terraform.zip && \
    unzip /tmp/terraform.zip -d /usr/bin && \
    rm /tmp/terraform.zip

# Install SOPS
ARG SOPS_VERSION="v3.6.0"
RUN wget -q https://github.com/mozilla/sops/releases/download/${SOPS_VERSION}/sops-v3.6.0.linux -O /usr/local/bin/sops && \
    chmod +x /usr/local/bin/sops

ENTRYPOINT ["/bin/sh"]
