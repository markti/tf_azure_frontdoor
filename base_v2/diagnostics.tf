
resource "azurerm_monitor_diagnostic_setting" "frontdoor_diagnostic_setting" {

  name                        = "${var.name}-frontdoor-logs"
  target_resource_id          = azurerm_frontdoor.frontdoor.id
  log_analytics_workspace_id  = var.loganalytics_workspace_id

  log {
    category = "FrontdoorAccessLog"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }
  log {
    category = "FrontdoorWebApplicationFirewallLog"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
    }
  }

}