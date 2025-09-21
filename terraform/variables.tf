variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-west-2"
}

variable "vpc_name" {
  description = "name of the VPC"
  type        = string
  default     = "url-shortener-vpc"
}

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}
