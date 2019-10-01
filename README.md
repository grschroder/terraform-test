# terraform-test

## How to use?

* Download terraform cli and put in the same folder of repository files.
* Create a file named: provider.tf and fill the informations:

```yaml
provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
  access_key = "your_aws_access_key"
  secret_key = "your_aws_secret_key"
}
```



* Run terraform init.
* Run terraform apply.
