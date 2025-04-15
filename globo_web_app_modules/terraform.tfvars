prefix         = "vld-5-dev"
region         = "eu-west-2"
vpc_cidr_block = "10.0.0.0/16"
vpc_public_subnets_cidr_block = [
  "10.0.0.0/24",
  "10.0.1.0/24"
]

billing_code = "VLD"
company      = "Globomantics"
project      = "Globomantics Pluralsight"

availability_zone  = "eu-west-2a"
availability_zones = ["eu-west-2a", "eu-west-2b"]

instance_type = "t3.micro"
