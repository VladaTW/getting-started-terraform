variable "region" {
  type        = string
  description = "The AWS region to deploy the application"
  sensitive = false
#   default     = "us-east-1"
}

variable "prefix" {
  type        = string
  description = "Prefix for resource names"
} 


