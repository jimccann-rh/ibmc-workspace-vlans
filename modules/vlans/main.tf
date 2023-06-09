#resource "ibm_network_vlan" "public" {
#  name       = "${var.datacenter}-public"
#  datacenter = var.datacenter
#  type       = "PUBLIC"
#  router_hostname = "fcr01a.${var.datacenter}"
#  tags       = var.tags
#}


############# This is special use for the "dal-private vlan"

resource "ibm_network_gateway_vlan_association" "gateway_vlan_association_dal_private" {
  gateway_id      = var.gateway_id
  network_vlan_id = var.network_vlan_id_dal_private
  bypass          = false
}

############# This is special use for the "dal-private vlan"







resource "ibm_network_vlan" "segment_221" {
  name       = "${var.project}-segment-221"
  datacenter = var.datacenter
  type       = "PRIVATE"
  router_hostname = "bcr01a.${var.datacenter}"
#  router_hostname = replace(ibm_network_vlan.public.router_hostname, "/^f/", "b")
  tags = var.tags
}


resource "ibm_network_gateway_vlan_association" "gateway_vlan_association_221" {
  gateway_id      = var.gateway_id 
  network_vlan_id = ibm_network_vlan.segment_221.id
  bypass          = false
}


resource "ibm_network_vlan" "segment_222" {
  name       = "${var.project}-segment-222"
  datacenter = var.datacenter
  type       = "PRIVATE"
  router_hostname = "bcr01a.${var.datacenter}"
  tags = var.tags
}

resource "ibm_network_gateway_vlan_association" "gateway_vlan_association_222" {
  gateway_id      = var.gateway_id
  network_vlan_id = ibm_network_vlan.segment_222.id
  bypass          = false
}

