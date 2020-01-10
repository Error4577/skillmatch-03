terraform {
  backend "s3" {
    bucket = "my-sample-terraform-ishihara"
    key    = "skillmatch/ecr/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}
