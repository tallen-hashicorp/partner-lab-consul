# partner-lab-consul

## Prerequisites
To complete this tutorial you will need the following:
* Basic command line access
* [Terraform v1.0.0+](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) CLI installed
* [Git](https://git-scm.com/) installed
* Admin access to the [HashiCorp Cloud Platform (HCP) Consul portal](https://portal.cloud.hashicorp.com/sign-in?utm_source=learn)
> **_NOTE:_**  HCP `Admin` access is necessary to create the Service Principal credentials used by Terraform to interact with HCP. If you already have a Service Principal key and client id provided by your admin, you only require `Contributor` access. If you are an `Admin` and would like to create a Service Principal, check [Deploy HCP Consul with Terraform tutorial](https://developer.hashicorp.com/consul/tutorials/cloud-production/,terraform-hcp-consul-provider) for instructions on how to create a Service Principal. Alternivly this is detailed in this [guide](#create-service-principal-and-key)
* Your AWS credentials configured locally.
You can configure the AWS credentials using environment variables.
```bash
export AWS_ACCESS_KEY_ID=<your AWS access key ID>
export AWS_SECRET_ACCESS_KEY=<your AWS secret access key>
export AWS_SESSION_TOKEN=<your AWS session token>
```

## Create service principal and key
To leverage the Terraform integration and be able to deploy your HCP Consul using Terraform, you have to create a Service Principal and a key associated to it.

From the left menu select Access Control (IAM) in the Settings section.

In the Access Control (IAM) page click on the Service Principals tab, and on the page click on the create link.

Use the name you prefer to create the Service Principal (we used learn-hcp for this tutorial) but remember to use Contributor as the role.

![Create Service Principal](./docs/assets1.avif)

Once the Service Principal is created, click on the service principal name on the page to view its details. From the detail page, click on + Generate key. A popup like the following will appear:

![Create Service Principal Key](./docs/assets2.avif)

> **_NOTE:_** Remember to copy the Client ID and secret, won't be able to retrieve the secret later and you'll have to use in the next step.

## Configure envrioment variables
```bash
export TF_VAR_hcp_client_id=<your HCP client id>
export TF_VAR_hcp_client_secret=<the HCP key generated>
export TF_VAR_hcp_project_id=<the HCP project key>
export AWS_ACCESS_KEY_ID=<you AWS Key ID>
export AWS_SECRET_ACCESS_KEY=<you AWS Secret Key ID>
export AWS_SESSION_TOKEN=<you AWS Session Token>
```

## Run Terrafrom

```bash
terraform init
terraform apply
```

## Usefull Reading
* [Deploy HCP Consul with Terraform](https://developer.hashicorp.com/consul/tutorials/cloud-production/terraform-hcp-consul-provider)
* [Deploy HCP Consul with EC2 using Terraform](https://developer.hashicorp.com/consul/tutorials/cloud-deploy-automation/consul-end-to-end-ec2)
* [Get started with end-to-end deployment configuration](https://developer.hashicorp.com/consul/tutorials/cloud-deploy-automation/consul-end-to-end-overview)
* [HashiCorp Cloud Platform (HCP) Provider](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs)