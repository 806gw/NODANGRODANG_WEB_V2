param name string
param location string = 'Korea Central'

module db './db.bicep' = {
  name: 'db'
  scope: resourceGroup()
  params: {
    environmentName: name
    location: location
  }
}

module aiservice './aiservice.bicep' = {
  name: 'aiservice'
  scope: resourceGroup()
  params: {
    aiAppName: '${name}-ai'
    location: location
  }
}
