variable "name" {
    type = string
    description = "The name used for the Azure Function Resource"
}
variable "location" {    
    type = string
    description = "The Azure Region to deploy into"
}
variable "resource_group_name" {    
    type = string
    description = "The Azure Resource Group to deploy into"
}
variable "app_name" { }
variable "env_name" { }

variable "loganalytics_workspace_id" { }

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