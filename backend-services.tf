resource "aws_db_subnet_group" "vpro_rds_subgrp" {
  name       = "vpro-rds-subgrp"
  subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]]
  tags = {
    Name = "vpro-rds-subgrp"
  }
}

resource "aws_elasticache_subnet_group" "vpro_cache_subgrp" {
  name       = "vpro-cache-subnet-grp"
  subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]]
  tags = {
    Name = "vpro-cache-subnet-grp"
  }
}



resource "aws_db_instance" "vpro_rds_instance" {
  allocated_storage = 20

  engine         = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro"

  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  db_name                = var.dbname
  username               = var.dbuser
  password               = var.dbpass
  db_subnet_group_name   = aws_db_subnet_group.vpro_rds_subgrp.name
  vpc_security_group_ids = [aws_security_group.backend_sg.id]
}

resource "aws_elasticache_cluster" "vpro_cache_instance" {
  cluster_id           = "vpro-cache-cluster"
  engine               = "memcached"
  node_type            = "cache.t3.micro"
  engine_version       = "1.6.22"
  num_cache_nodes      = 1
  security_group_ids   = [aws_security_group.backend_sg.id]
  subnet_group_name    = aws_elasticache_subnet_group.vpro_cache_subgrp.name
  parameter_group_name = "default.memcached1.6"
  port                 = 11211
}


resource "aws_mq_broker" "vpro-rm-instance" {
  broker_name                = "vpro-rmq-instance"
  engine_type                = "RabbitMQ"
  engine_version             = "4.2"
  host_instance_type         = "mq.m7g.medium"
  deployment_mode            = "CLUSTER_MULTI_AZ"
  subnet_ids                 = module.vpc.private_subnets
  security_groups            = [aws_security_group.backend_sg.id]
  auto_minor_version_upgrade = true

  user {
    username = var.rmquser
    password = var.rmqpass
  }
}