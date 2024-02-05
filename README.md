# Repo for general testing of AWS resources, mock infrastructure, modular deployments, and etc.

1. network: main VPC with subnets for reference testing (via remote state or SSM Parameter Store)
    - modules:
        network

2. nginx-network: deployment of  EC2 instances for general use
    - modules:
        network
        compute

3. state-reference-test: deployment using outputs of another deployment
    - module:
        network
        compute