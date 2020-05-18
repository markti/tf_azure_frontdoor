
module "frontdoor" {
  
  source                    = "../base"

  app_name                  = var.app_name
  env_name                  = var.env_name
  
  name                      = var.name
  resource_group_name       = var.resource_group_name
  location                  = var.location

  frontend_hostname         = var.frontend_hostname
  backend_fqdn              = var.backend_fqdn
  backend_host_header       = var.backend_host_header
  backend_healthprobe_path  = var.backend_healthprobe_path

}

resource "azurerm_monitor_diagnostic_setting" "frontdoor_diagnostic_setting" {

  name                        = "${var.name}-frontdoor-logs"
  target_resource_id          = module.frontdoor.id
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