variable "resource_group_name" {
    description = "Name of Azure Resource Group"
    type        = string
    default     = "aks-rg"
}

variable "location" {
    description = "Name of Azure Region"
    type        = string
    default     = "UK South"
}

variable "vnet_address_space" {
  description = "Address space for Virtual Network."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "my_ip" {
  description = "Your IP address for security rules"
  type        = string
}

variable "my_client_id" {
  description = "Your Azure AD Service Principal client ID"
  type        = string
}

variable "my_client_secret" {
  description = "Your Azure AD Service Principal client secret"
  type        = string
}