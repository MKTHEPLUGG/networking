using '../../templates/main.bicep'

param purpose = 'shared'
param location = 'westeurope'
param environment = 'integration'
// param kvName = 'kv-avdb'
param addressPrefixes = [
  '192.168.0.0/16'
]
param subnetPrefix = '192.168.0.0/24'
param gitRepo = '#{Build.Repository.Name}#'
param gitRef = '#{GitVersion.SemVer}#'