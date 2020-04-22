variable "role_arn" {
  type = string
  description = "The role to use when implementing this."
}

variable "hec_token" {
  type = string
  description = "The HEC token to use."
}

variable "endpoint_url" {
  type = string
  description = "The HEC endpoint URL."
}

variable "log_buckets" {
  type = list(string)
  description = "The list of elb and cloudfront log buckets."
  default = []
}
