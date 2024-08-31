resource "azurerm_network_interface" "nics" {
  for_each = var.nics
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  ip_configuration {
    name = each.value.ip_configuration.name
    subnet_id = data.azurerm_subnet.subnets[each.value.subnetss].id
    private_ip_address_allocation = "Dynamic"
  }
}

data "azurerm_subnet" "subnets" {
  for_each = var.subnets
  name = each.value.name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name = each.value.resource_group_name
}
