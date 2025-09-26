variable "namespace_name" {
  description = "The name of the Event Hub Namespace"
  type        = string
  default     = "eventhub-namespace"
}

variable "eh_name" {
  description = "The name of the Event Hub"
  type        = string
  default = "eventhub1" 
}

variable "location" {
  description = "Azure location for Event Hub"
  type        = string
  default = "East US"
}

variable "rg_name" {
  description = "Resource Group name for Event Hub"
  type        = string
}


