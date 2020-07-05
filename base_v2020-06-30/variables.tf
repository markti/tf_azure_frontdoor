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
variable "primary_backend" {
  type = object({

    host_header      = string
    address          = string
    http_port        = string
    https_port       = string

  })
}
variable "secondary_backend" {
  type = object({

    host_header      = string
    address          = string
    http_port        = string
    https_port       = string

  })
}
variable "healthprobe_settings" {
  type = object({

    path = string

  })
}