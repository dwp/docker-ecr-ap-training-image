variable "costcode" {
  type    = string
  default = ""
}

variable "assume_role" {
  type        = string
  default     = "ci"
  description = "IAM role assumed by Concourse when running Terraform"
}

variable "region" {
  type    = string
  default = "eu-west-2"
}
#
#
#data "aws_vpc_endpoint_service" "internet_proxy" {
#  filter {
#    name   = "tag:Name"
#    values = ["internet_proxy"]
#  }
#}
#
#data "aws_vpc_endpoint" "internet_proxy" {
#  service_name = data.aws_vpc_endpoint_service.internet_proxy.service_name
#  vpc_id       = data.terraform_remote_state.concourse.outputs.aws_vpc.id
#}
#
#variable "no_proxy" {
#  type    = string
#  default = join(",", data.terraform_remote_state.concourse.outputs.no_proxy_list)
#}
#
#variable "full_proxy" {
#  type = string
#  default = join("http://",data.aws_vpc_endpoint.internet_proxy.dns_entry[0].dns_name,":3128")
#}
