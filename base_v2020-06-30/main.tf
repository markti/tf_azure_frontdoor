resource "azurerm_frontdoor" "frontdoor" {
  name                                         = var.service.name
  resource_group_name                          = var.environment.resource_group_name

  enforce_backend_pools_certificate_name_check = false

  # PRIMARY
  routing_rule {
    name               = "PrimaryRoutingRules"
    accepted_protocols = [ "Https" ]
    patterns_to_match  = [ "/*" ]
    frontend_endpoints = [ "DefaultEndpoint" ]
    forwarding_configuration {
      forwarding_protocol = "MatchRequest"
      backend_pool_name   = "PrimaryBackend"
    }
  }

  backend_pool_load_balancing {
    name = "baseline"
    additional_latency_milliseconds = 1000
  }

  backend_pool_health_probe {
    name      = "baseline"
    protocol  = "Https"
    path      = var.healthprobe_settings.path
  }

  backend_pool {
    name = "PrimaryBackend"
    backend {
      host_header = var.primary_backend.host_header
      address     = var.primary_backend.address
      http_port   = var.primary_backend.http_port
      https_port  = var.primary_backend.https_port
    }

    load_balancing_name = "baseline"
    health_probe_name   = "baseline"
  }

  backend_pool {
    name = "SecondaryBackend"
    backend {
      host_header = var.secondary_backend.host_header
      address     = var.secondary_backend.address
      http_port   = var.secondary_backend.http_port
      https_port  = var.secondary_backend.https_port
    }

    load_balancing_name = "baseline"
    health_probe_name   = "baseline"
  }

  frontend_endpoint {
    name                              = "DefaultEndpoint"
    host_name                         = "${var.service.name}.azurefd.net"
    custom_https_provisioning_enabled = false

  }

  tags = {
    app = var.environment.app_name
    env = var.environment.env_name
  }

}