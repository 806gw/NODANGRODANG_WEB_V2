param aiAppName string
param location string

resource aiServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: '${aiAppName}-plan'
  location: location
  sku: {
    name: 'B1'
    tier: 'Basic'
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

resource aiWebApp 'Microsoft.Web/sites@2021-02-01' = {
  name: aiAppName
  location: location
  kind: 'app,linux'
  properties: {
    serverFarmId: aiServicePlan.id
    siteConfig: {
      linuxFxVersion: 'PYTHON|3.9'
      appCommandLine: 'python -m flask run --host=0.0.0.0 --port=8000'
    }
  }
}
