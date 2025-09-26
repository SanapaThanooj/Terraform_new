variable "vnet_name" {
  type =  string
    default = "example-network"
  
}
variable "rg_name" {
  description = "The name of the resource group"
  type        = string
  
}
variable "location" {
  description = "The location of the resource group"
  type        = string
  
}

variable "sn1_name" {
  type =  string
  description = "The name of the subnet"
    default = "subnet1"
  
}
variable "adrs_space" {
  type        = list(string)
  description = "The address prefixes for the virtual network"
    default     = ["10.0.0.1.0/16"]

} 
variable "nsg_name" {
  type        = string
  description = "The name of the network security group"
    default     = "nsg1"
  
}
variable "adrs_prefix" {
  type        = list(string)
  description = "The address prefixes for the subnet"
    default     = ["10.0.12.0/24"]
  
}
variable "vm_name" {
  type        = string
  description = "The name of the virtual machine"
    default     = "vm"
  
}
variable "vm_size" {
  type        = string
  description = "The size of the virtual machine"
    default     = "Standard_B1s"
  
}
variable "ni_name" {
  type        = string
  description = "The name of the network interface"
    default     = "nic1"
  
}