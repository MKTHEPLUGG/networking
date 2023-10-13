param purpose string
param location string
param environment string
param addressPrefixes array
param subnetPrefix string
param time string = utcNow()
param gitRef string
param gitRepo string

module myNetwork 'br:eruza123.azurecr.io/bicep/modules/network:v0.1.9' = {
  name: 'networkDeploy-${time}'
  params: {
    environment: environment
    location: location
    purpose: purpose
    subnetPrefix: subnetPrefix
    addressPrefixes: addressPrefixes
    gitRef: gitRef
    gitRepo: gitRepo
  }
}
