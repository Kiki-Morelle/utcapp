data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  # Select only the specified number of AZs requested.
  azs = slice(data.aws_availability_zones.available.names, 0, var.az_count)
}

variable "az_count" {
  description = "Number of availability zones to use."
  type        = number
  default     = 2

  validation {
    condition     = var.az_count > 0
    error_message = "az_count must be greater than zero."
  }
}
