# env = "dev"
#
# components = {
#   frontend = {
#     name          = "frontend"
#     instance_type = "t3.small"
#     port_no       = 80
#     disk_size     = 25
#   }
#
#   mysql = {
#     name          = "mysql"
#     instance_type = "t3.small"
#     port_no       = 3306
#     disk_size     = 25
#   }
#
#   backend = {
#     name          = "backend"
#     instance_type = "t3.small"
#     port_no       = 8080
#     disk_size     = 25
#   }
#
# }
#
# prometheus_servers = ["172.31.35.0/32"]

env = "dev"

vpc = {
  main = {
    vpc_cidr_block   = "10.0.0.0/16"
    lb_subnet_cidr   = ["10.0.0.0/24", "10.0.1.0/24"]
    eks_subnet_cidr  = ["10.0.2.0/24", "10.0.3.0/24"]
    db_subnet_cidr   = ["10.0.4.0/24", "10.0.5.0/24"]
    azs              = ["us-east-1a", "us-east-1b"]
    default_vpc_id   = "vpc-0e93ff27d39f864b7"
    default_vpc_cidr = "172.31.0.0/16"
    default_vpc_rt   = "rtb-0c956acbaf6b0f983"
  }
}

tags = {
  project_name = "Expense"
  bu_unit      = "finance"
  env          = "dev"
  created_with = "Terraform"
}

eks = {
  main = {
    eks_version = "1.30"
    node_groups = {
      ng1 = {
        instance_types = ["t3.large"]
        capacity_type  = "SPOT"
        node_max_size  = 5
        node_min_size  = 1
      }
    }
  }
}

rds = {
  main = {
    engine         = "mysql"
    engine_version = "8.0"
    family         = "mysql8.0"
    instance_class = "db.t3.micro"
  }
}

