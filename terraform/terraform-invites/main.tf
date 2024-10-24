terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = "2.5.0"
    }
  }
}

provider "confluent" {
  cloud_api_key    = var.confluent_cloud_api_key
  cloud_api_secret = var.confluent_cloud_api_secret
}

data "confluent_organization" "this" {}

resource "confluent_invitation" "invite" {
    count = var.user_count
    email = "flinkdemo2024+lce${format("%03d", count.index + 1)}@gmail.com"
}