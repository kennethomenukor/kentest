//***** SCOPE *****//
targetScope = 'resourceGroup'

//***** PARAMETERS *****//
@description('Expressroute2 circuit parameters.')
param p_circuit2 array

@description('Azure region.')
param p_location string

@description('Resource tags.')
param p_tags object = {}

//***** RESOURCES *****//
resource expressRouteC2 'Microsoft.Network/expressRouteCircuits@2024-01-01' = [
  for item in p_circuit2: {
    name: item.name
    location: p_location
    tags: p_tags
    sku: {
      name: item.sku.name
      tier: item.sku.tier
      family: item.sku.family
    }
    properties: {
      serviceProviderProperties: {
        serviceProviderName: item.properties.serviceProviderProperties.serviceProviderName
        peeringLocation: item.properties.serviceProviderProperties.peeringLocation
        bandwidthInMbps: item.properties.serviceProviderProperties.bandwidthInMbps
      }
    }
  }
]
