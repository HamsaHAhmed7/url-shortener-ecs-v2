variable "vpc_id" {
  type = string
}

variable "alb_sg_name" {
  type    = string
  default = "alb-sg-url-shortener"
}

variable "ecs_sg_name" {
  type    = string
  default = "ecs-sg-url-shortener"
}
