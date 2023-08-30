resource "azurerm_kubernetes_cluster" "DEV" {
  name                = "bala-aks"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "devclus"

  default_node_pool {
    name                = "devnepoll"
    vm_size             = "Standard_DS2_v2"
    enable_auto_scaling = "true"
    max_count           = 3
    min_count           = 1
    os_disk_size_gb     = "30"
    type                = "VirtualMachineScaleSets"
    vnet_subnet_id      = azurerm_subnet.aks-subnet.id
  }

  identity {
    type = "SystemAssigned"
  }
  ingress_application_gateway {
    gateway_id = azurerm_application_gateway.main.id
  }
  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }
  depends_on = [azurerm_application_gateway.main]
}
