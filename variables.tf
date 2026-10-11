
variable "project_network" {
  description = "Name of the existing cPouta project network"
  type        = string
}

variable "name_prefix" {
  description = "Prefix used for names of created resources"
  type        = string
  default     = "week7"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key on your computer"
  type        = string
  default     = "~/.ssh/week7_ed25519.pub"
}

variable "ssh_allowed_cidr" {
  description = "Public IP address range allowed to connect through SSH"
  type        = string

  validation {
    condition     = can(cidrhost(var.ssh_allowed_cidr, 0))
    error_message = "ssh_allowed_cidr must be a valid CIDR range, e.g. 203.0.113.45/32."
  }
}

variable "image_name" {
  description = "Name of the Linux image for the virtual machine"
  type        = string
  default     = "Ubuntu-24.04"
}

variable "flavor_name" {
  description = "Size of the virtual machine"
  type        = string
  default     = "standard.tiny"
}

variable "student_name" {
  description = "Name displayed on the web page"
  type        = string
}

variable "page_message" {
  description = "Additional message displayed on the web page"
  type        = string
  default     = "My web server was created with OpenTofu."
}
