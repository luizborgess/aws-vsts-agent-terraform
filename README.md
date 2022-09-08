# aws-vsts-agent-terraform

## Description

Terraform code that deploys VSTS Agents, in a desired quantity that fits your needs! Deploys Ubuntu EC2 instances in aws containing raw VSTS agent.


## Requeriments:

- Terraform and AWS cli configured.

- AWS network vpc, subnets and security groups pre configured.

- AWS key pair pre created.
## How To
- 1 Clone the repo

- 2 Put your configuration in variable.tf according to the description

- 3 Open a terminal:

    ```
    terraform init
    terraform plan
    terraform apply -y
    ```

- 4 Check in your AWS console if infra was properly created.

- 5 Check in Azure DevOps your new agents.



## Planned

- Integrate terraform code with a S3 Bucket and store the tf.state.
- Create a .sh script to install build tools.
- Add a alternative .tf file that creates a keypair and steps to do so.