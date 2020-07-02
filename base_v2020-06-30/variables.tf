variable "environment" {
  type = object({

    app_name            = string
    env_name            = string
    resource_group_name = string
    location            = string
    location_suffix     = string

  })
}
variable "service" {
  type = object({

    name         = string
    workspace_id = string

  })
}
variable "frontend" {
  type = object({

    host_name        = string

  })
}
variable "backend" {
  type = object({

    host_header      = string
    address          = string
    healthprobe_path = string
    http_port        = string
    https_port       = string

  })
}