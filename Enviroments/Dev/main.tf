module "resource_group" {
  source = "../../Modules/Resource_Group"
  rgs = var.rg
}

module "virtual_network" {
  depends_on = [ module.resource_group ]
  source = "../../Modules/virtual_network"
  vnets = var.vnet
}

module "subnets" {
  depends_on = [ module.virtual_network ]
  source = "../../Modules/subnets"
  subnets = var.subnets
}

module "nics" {
  depends_on = [ module.resource_group,module.subnets ]
  source = "../../Modules/Nic"
  nics = var.nics
  subnets = var.subnets
}

module "virtual_machine" {
  depends_on = [ module.subnets,module.nics ]
  source = "../../Modules/virtual_machine"
  vmss = var.vms
  nics = var.nics
}
