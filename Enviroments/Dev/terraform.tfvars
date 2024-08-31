rg = {
    rg1 = {
     name = "testrg1"
     location = "West Europe"
    }
    rg2 = {
     name = "testrg2"
     location = "West Europe"
    }
}

vnet = {
    vnet1 ={
        name = "virtual_network1"
        location = "west Europe"
        resource_group_name = "testrg1"
        address_space = ["10.10.0.0/16"]
    }
        vnet2 ={
        name = "virtual_network2"
        location = "west Europe"
        resource_group_name = "testrg2"
        address_space = ["20.20.0.0/16"]
    }
}
subnets = {
    subnet1 = {
        name = "subnet1"
        resource_group_name = "testrg1"
        virtual_network_name = "virtual_network1"
        address_prefixes = ["10.10.1.0/24"]
    }
        subnet2 = {
        name = "subnet1"
        resource_group_name = "testrg2"
        virtual_network_name = "virtual_network2"
        address_prefixes = ["20.20.1.0/24"]
    }
}

nics = {
    nic1 ={
        name = "nic1"
        subnetss = "subnet1"
        resource_group_name = "testrg1"
        location = "west Europe"
        ip_configuration ={
            name = "ip1"
        }
    }
}

vms = {
    vm1 = {
        name = "testvm1"
        location = "west Europe"
        resource_group_name = "testrg1"
        nics =  "nic1"
    }
}
