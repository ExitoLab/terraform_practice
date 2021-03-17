.PHONY: all
all: terraform-fmt terraform-init terraform-validate

SHELL := /bin/bash -l

#format the terraform code
terraform-fmt:
	terraform fmt ${TERRAFORM_LAYER} 

terraform-init:
	cd ${TERRAFORM_LAYER} && \
	terraform init -input=false

terraform-validate:
    cd ${TERRAFORM_LAYER} && \
	terraform validate --vars-file=vars/dev.tfvars