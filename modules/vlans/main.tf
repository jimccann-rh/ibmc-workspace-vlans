#resource "ibm_network_vlan" "public" {
#  name       = "${var.datacenter}-public"
#  datacenter = var.datacenter
#  type       = "PUBLIC"
#  router_hostname = "fcr04a.${var.datacenter}"
#  tags       = var.tags
#}

resource "ibm_network_vlan" "segment_100" {
  name       = "${var.project}-dev-segment-100"
  datacenter = var.datacenter
  type       = "PRIVATE"
  router_hostname = "bcr04a.${var.datacenter}"
#  router_hostname = replace(ibm_network_vlan.public.router_hostname, "/^f/", "b")
  tags = var.tags
}


resource "ibm_network_gateway_vlan_association" "gateway_vlan_association_100" {
  gateway_id      = var.gateway_id 
  network_vlan_id = ibm_network_vlan.segment_100.vlan_number
  bypass          = false
}


resource "ibm_network_vlan" "segment_101" {
  name       = "${var.project}-dev-segment-101"
  datacenter = var.datacenter
  type       = "PRIVATE"
  router_hostname = "bcr04a.${var.datacenter}"
#  router_hostname = replace(ibm_network_vlan.public.router_hostname, "/^f/", "b")
  tags = var.tags
}

resource "ibm_network_gateway_vlan_association" "gateway_vlan_association_101" {
  gateway_id      = var.gateway_id
  network_vlan_id = ibm_network_vlan.segment_101.vlan_number
  bypass          = false
}

