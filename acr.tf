resource "azurerm_container_registry" "example" {
  name                = "containetest12"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
}

## Assing acr to aks azurerm_kubernetes_cluster

resource "azurerm_role_assignment" "acr-assign" {
  principal_id                     = azurerm_kubernetes_cluster.DEV.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.example.id
  skip_service_principal_aad_check = true
}