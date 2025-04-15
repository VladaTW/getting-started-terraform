variable "region" {
  type        = string
  description = "The AWS region to deploy the application"
  sensitive   = false
  #   default     = "us-east-1"
}

variable "prefix" {
  type        = string
  description = "Prefix for resource names"
}


variable "aws_access_key" {
  type        = string
  description = "AWS access key"
  sensitive   = true
}

variable "availability_zone" {
  type        = string
  description = "Availability zone for the resources"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of Availability Zones where subnets will be created"
}


variable "aws_secret_key" {
  type        = string
  description = "AWS secret key"
  sensitive   = true
}

## Add these after the first challenge

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in VPC"
  default     = true
}

variable "vpc_cidr_block" {
  type        = string
  description = "Base CIDR Block for VPC"
}

variable "vpc_public_subnets_cidr_block" {
  type        = list(string)
  description = "CIDR Blocks for Subnet in VPC"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Map a public IP address for Subnet instances"
  default     = true
}

variable "instance_type" {
  type        = string
  description = "Type for EC2 Instnace"
}

## Add these after the local value discussion

variable "company" {
  type        = string
  description = "Company name for resource tagging"
  default     = "Globomantics"
}

variable "project" {
  type        = string
  description = "Project name for resource tagging"
}

variable "billing_code" {
  type        = string
  description = "Billing code for resource tagging"
}
