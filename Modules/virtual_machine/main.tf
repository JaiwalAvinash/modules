resource "azurerm_linux_virtual_machine" "vmss" {
    for_each =  var.vmss
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.resource_group_name
    admin_username = "admin123"
    admin_password = "Admin@123456"
    size = "Standard_D1_v2"
    disable_password_authentication = "false"
    network_interface_ids = [data.azurerm_network_interface.nics[each.value.nics].id]
    os_disk {
      caching =  "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
    }
}
