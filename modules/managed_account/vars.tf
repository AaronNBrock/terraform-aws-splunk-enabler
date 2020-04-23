variable "role_arn" {
  description = "The Role to assume with permissions in the account."
  type        = string
}

variable "enable_flowlog" {
  default = true
  type    = bool
}

variable "enabled" {
  default = true
  type    = bool
}

variable "region" {
  default = "us-east-1"
  type    = string
}

variable "endpoint_url" {
  type        = string
  description = "The URL endpoint for the HEC."
}

variable "hec_token" {
  type        = string
  description = "The HEC token to use."
}

