terraform {
  cloud {
    organization = "mitchduncan"
    workspaces {
      name = "aws-kms-keys"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_kms_key" "IDR_kms_key" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
}

resource "aws_sqs_queue" "idr_sqs_queue" {
  name                              = "IDR-sqs-queue"
  kms_master_key_id                 = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300
}
