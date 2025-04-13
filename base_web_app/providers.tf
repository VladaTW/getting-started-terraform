###########################################
#######           PROVIDERS         #######
###########################################

provider "aws" {
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    region = "eu-west-2"

}

# block_type "label" "name" {
#     key = value
#     nested_block {
#         key = "value"
#     }
# }

# provider "aws" {
#   access_key = "ACCESS_KEY"
#   secret_key = "SECRET_KEY"
#   region     = "us-east-1"
#   region = "eu-north-1" # Stockholm
#   region = "eu-west-1" # Ireland
#   region = "eu-west-2" # London 
#   region = "eu-west-3" # Paris#
#   region = "eu-central-1" # Frankfurt  
# }

