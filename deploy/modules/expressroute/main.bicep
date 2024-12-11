//***** SCOPE *****//
targetScope = 'subscription'

//***** PARAMETERS *****//
@description('Expressroute circuit 2 parameters.')
param p_circuit2 array

@description('Azure region.')
param p_location string

@description('Resource group name.')
param p_rsg_circuit_name string

@description('Resource tags.')
param p_tags object = {}

//***** RESOURCES *****//
resource rsg_circuit2 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  location: p_location
  name: p_rsg_circuit_name
  tags: p_tags
}

//***** MODULES *****//
module mod_expressRouteCircuit2 'expressroute.bicep' = {
  scope: rsg_circuit2
  name: 'expressRouteCircuit2Deploy'
  params: {
    p_circuit2: p_circuit2
    p_location: p_location
    p_tags: p_tags
  }
}
