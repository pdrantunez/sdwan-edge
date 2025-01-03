# Create security group:

resource "azurerm_network_security_group" "transport" {
  name                = "${var.name}-transport-nsg"
  location            = data.azurerm_resource_group.rg_c8000v.location
  resource_group_name = data.azurerm_resource_group.rg_c8000v.name

  security_rule {
    name                         = "All"
    priority                     = 1000
    direction                    = "Inbound"
    access                       = "Allow"
    protocol                     = "*"
    source_port_range            = "*"
    destination_port_range       = "*"
    source_address_prefixes      = "${var.acl_cidr_blocks}"
    destination_address_prefix   = "*"
  }

  security_rule {
    name                       = "outbound"
    priority                   = 1020
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = var.common_tags
}

resource "azurerm_network_security_group" "service" {
  name                = "${var.name}-service-nsg"
  location            = data.azurerm_resource_group.rg_c8000v.location
  resource_group_name = data.azurerm_resource_group.rg_c8000v.name

  security_rule {
    name                         = "All"
    priority                     = 1000
    direction                    = "Inbound"
    access                       = "Allow"
    protocol                     = "*"
    source_port_range            = "*"
    destination_port_range       = "*"
    source_address_prefixes      = "${var.acl_cidr_blocks}"
    destination_address_prefix   = "*"
  }

  security_rule {
    name                       = "outbound"
    priority                   = 1020
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = var.common_tags
}


