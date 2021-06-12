variable "region" {
  default     = "us-east-2"
  description = "AWS region"
}

# multiple ways to set this. one is:
# export TF_VAR_db_password="..."
variable "db_password" {
  description = "RDS root user password"
  sensitive   = true
}
