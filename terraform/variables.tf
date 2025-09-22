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

variable "alb_sg_name" {
  type    = string
  default = "alb-sg-url-shortener"
}

variable "ecs_sg_name" {
  type    = string
  default = "ecs-sg-url-shortener"
}