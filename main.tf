terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
      version = "~> 3.0"
    }
  }
}

provider "newrelic" {
  account_id = var.account_id
  api_key    = var.api_key
  region     = "US"
}

resource "newrelic_alert_policy" "demo" {
  name = "Harness Demo Policy"
}

resource "newrelic_nrql_alert_condition" "high_error_rate" {
  account_id = var.account_id
  policy_id  = newrelic_alert_policy.demo.id

  name = "High Error Rate"

  type = "static"

  nrql {
    query = "SELECT count(*) FROM TransactionError"
  }

  critical {
    operator              = "above"
    threshold             = 10
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}
