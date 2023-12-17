identity_token "aws" {
  audience = ["aws.workload.identity"]
}

deployment "production" {
  variables = {
    region              = "us-east-1"
    role_arn            = "arn:aws:iam::609845769455:role/tfc-stack-superadmin"
    identity_token_file = identity_token.aws.jwt_filename
  }
}
