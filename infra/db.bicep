param environmentName string
param location string

resource mySqlServer 'Microsoft.DBforMySQL/flexibleServers@2023-06-30' = {
  name: '${environmentName}-db'
  location: location
  sku: {
    name: 'Standard_B1ms'
    tier: 'Burstable'
    capacity: 1
    family: 'Gen5'
  }
  properties: {
    version: '8.0.21'
    sslEnforcement: 'Disabled'
    storage: {
      autoGrow: 'Enabled'
      storageSizeGB: 20
    }
    administratorLogin: 'adminuser'
    administratorLoginPassword: 'cloud24admin!!'
    publicNetworkAccess: 'Enabled'
  }

  resource firewall_all 'firewallRules@2021-05-01' = {
    name: 'allow-all-IPs'
    properties: {
      startIpAddress: '0.0.0.0'
      endIpAddress: '255.255.255.255'
    }
  }
}

resource mySqlDatabase 'Microsoft.DBforMySQL/flexibleServers/databases@2023-06-30' = {
  parent: mySqlServer
  name: 'cdc'
  properties: {
    charset: 'utf8mb4'
    collation: 'utf8mb4_unicode_ci'
  }
}

output mySqlServerName string = mySqlServer.name
output mySqlDatabaseName string = mySqlDatabase.name
