# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MIT

resource "hcp_hvn" "partner_hvn" {
  hvn_id         = var.hvn_id
  cloud_provider = var.cloud_provider
  region         = var.region
}

resource "hcp_consul_cluster" "partner_hcp" {
  hvn_id          = hcp_hvn.partner_hvn.hvn_id
  cluster_id      = var.cluster_id
  tier            = "standard"
  public_endpoint = true
}