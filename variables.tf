variable "newrelic_account_id" {
  description = "Your New Relic account ID"
  type        = number
}

variable "newrelic_api_key" {
  description = "Your New Relic user API key"
  type        = string
  sensitive   = true
}

variable "newrelic_region" {
  description = "New Relic region: US or EU"
  type        = string
  default     = "US"
}

variable "alert_policy_name" {
  description = "Name of the alert policy"
  type        = string
  default     = "Demo Harness Terraform Alert Policy"
}

variable "alert_condition_name" {
  description = "Name of the alert condition"
  type        = string
  default     = "High Transaction Error Count - Demo"
}
