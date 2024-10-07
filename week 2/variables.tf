variable "location" {
  type        = string
  default     = "westeurope"
  description = "Lieu du groupe de ressources"
}

variable "groupname" {
  default     = "testResourceGroupAPI"
  description = "Nom du groupe de ressources"
}

variable "servername" {
  default     = "testpostgresservermat"
  description = "Nom du serveur PostgreSQL"

  validation {
    condition     = can(regex("^[0-9a-z][-0-9a-z]{1,61}[0-9a-z]$", var.servername))
    error_message = "The PostgreSQL server name must be between 3 and 63 characters long, start with a lowercase letter or number, and can only contain lowercase letters, numbers, and hyphens."
  }
}

variable "adminuser" {
  default     = "testAdmin1234"
  description = "Nom de l'administrateur PostgreSQL"
}

variable "adminpassword" {
  default     = "1LuvP0stGreSQL"
  description = "Mot de passe PostgreSQL"
}