module "vpc" {
  source     = "./modules/vpc"
  vpc_name   = var.vpc_name
  cidr_block = var.cidr_block
}

module "sg" {
  source   = "./modules/sg"
  ecs_sg_name = var.ecs_sg_name
  alb_sg_name = var.alb_sg_name
  vpc_id   = module.vpc.vpc_id
}
