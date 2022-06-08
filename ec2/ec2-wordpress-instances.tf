# Terraform Settings Block
module "alfaco_module_ec2" {

  #source="git::https://github.com/jlbionville/tf-workspace/tree/ec2workspace"
  source       = "/home/ubuntu/depots/tf-workspace/ec2"
  ec2_tag_name = "testmodule"
 
}

# locals {

# }


