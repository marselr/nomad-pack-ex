# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "job_name" {
  description = "The name to use as the job name which overrides using the pack name"
  type        = string
  // If "", the pack name will be used
  default = ""
}

variable "region" {
  description = "The region where jobs will be deployed"
  type        = string
  default     = ""
}

variable "datacenters" {
  description = "A list of datacenters in the region which are eligible for task placement"
  type        = list(string)
  default     = ["dc1"]
}

variable "count" {
  description = "The number of app instances to deploy"
  type        = number
  default     = 1
}

variable "message" {
  description = "The message your application will render"
  type        = string
  default     = "Hello World!"
}

variable "register_consul_service" {
  description = "If you want to register a consul service for the job"
  type        = bool
  default     = true
}

variable "consul_service_name" {
  description = "The consul service name for the psmarsel application"
  type        = string
  default     = "psmarsel-nginx"
}

variable "consul_service_tags" {
  description = "The consul service name for the psmarsel application"
  type        = list(string)
  // defaults to integrate with Fabio or Traefik
  // This routes at the root path "/", to route to this service from
  // another path, change "urlprefix-/" to "urlprefix-/<PATH>" and
  // "traefik.http.routers.http.rule=Path(∫/∫)" to
  // "traefik.http.routers.http.rule=Path(∫/<PATH>∫)"
  default = [
    "urlprefix-/",
    "traefik.enable=true",
    "traefik.http.routers.http.rule=Path(`/`)",
  ]
}

variable "http_port" {
  description = "The Nomad client port that routes to the Nginx. This port will be where you visit your load balanced application"
  type        = number
  default     = 8082
}

variable "version_tag" {
  description = "The docker image version. For options, see https://hub.docker.com/_/nginx"
  type        = string
  default     = "1.21"
}
