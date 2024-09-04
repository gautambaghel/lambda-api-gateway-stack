# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "aws" {
  audience = ["<Set to your AWS IAM assume-role audience>"]
}

deployment "development" {
  inputs = {
    regions        = ["us-east-1"]
    role_arn       = "<Set to your development AWS account IAM role ARN>"
    identity_token = identity_token.aws.jwt
    default_tags   = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

deployment "production" {
  inputs = {
    regions        = ["us-east-1", "us-west-1"]
    role_arn       = "<Set to your production AWS account IAM role ARN>"
    identity_token = identity_token.aws.jwt
    default_tags   = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}
