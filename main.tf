resource "newrelic_alert_policy" "demo_policy" {
  name                = var.alert_policy_name
  incident_preference = "PER_POLICY"
}

resource "newrelic_nrql_alert_condition" "high_error_count" {
  account_id = var.newrelic_account_id
  policy_id  = newrelic_alert_policy.demo_policy.id

  name        = var.alert_condition_name
  type        = "static"
  enabled     = true
  description = "Demo alert condition created using Terraform through Harness pipeline."

  nrql {
    query = "SELECT count(*) FROM TransactionError"
  }

  critical {
    operator              = "above"
    threshold             = 5
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }

  violation_time_limit_seconds = 3600
}
