# AWS S3 Subdomain Takeover

![OffensiveTerraform](https://img.shields.io/badge/hack-success)
![OffensiveTerraform](https://img.shields.io/badge/offensive-terraform-blueviolet)
![OffensiveTerraform](https://img.shields.io/badge/aws-important)

Offensive Terraform module which takes over a subdomain which has a CNAME record pointing to non-existing S3 bucket in target's Route53. The module creates a S3 bucket with a name as subdomain in the specific AWS region that CNAME record is pointing to. Also, it uploads a simple web page with "404 Page Not Found" text.

![Attack Diagram](https://raw.githubusercontent.com/offensive-terraform/terraform-aws-s3-subdomain-takeover/master/diagram.jpg)

> *Note: Must specify a S3 bucket region in the provider section.*

## Usage
```
provider "aws" {
    region = "us-east-1"
}

module "s3-subdomain-takeover" {
    source  = "offensive-terraform/s3-subdomain-takeover/aws"

    subdomain = "subdomain.example.com"
}

output "s3_website_endpoint" {
  value = module.s3-subdomain-takeover.s3_website_endpoint
}
```
## Author
Module managed by https://github.com/iganbold
