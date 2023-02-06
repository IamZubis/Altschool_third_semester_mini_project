
variable "access_key" {
  default = "AKIAXEJMWSELPFFI3QRX"
}

variable "secret_key" {
	type = string
	default = "jEbJzaib3eCGlIwnchdvQL6SlFiAhqI73jFq4PlU"
}

variable "ami" {
	type = string
	default = "ami-0a89a7563fc68be84"
}

variable "instance_type" {
	type = string
	default = "t2.micro"
}

variable "domain-name" {
  default    = "osujizubis.me"
  type        = string
  description = "Domain name"
}
