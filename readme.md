# Azure Bicep Network & NSG Deployment Documentation

Welcome to the Azure Bicep Network & NSG Deployment repository. This documentation will guide you through the purpose and usage of the custom Bicep module and GitHub actions designed to facilitate Azure resource deployments.

## Overview

The custom module and workflow have been designed to deploy a network and Network Security Group (NSG) in Azure using the Bicep language. This documentation is structured to detail the various components: the main Bicep action, the workflow, and the Bicep code used for the deployment.

---

## 1. **Azure Bicep Network & NSG Deploy Action**

### Description:

This action deploys a network and NSG in Azure using a custom Bicep module.


### Inputs:

- **azureClientId**: Azure Client ID. (Required)
- **azureTenantId**: Azure Tenant ID. (Required)
- **azureSubscriptionId**: Azure Subscription ID. (Required)
- **environment**: Deployment environment (e.g., int, prod). (Required)
- **templateFile**: Bicep template file name without extension. (Required)
- **location**: Deployment location (e.g., we, eastus). (Required)
- **resourceGroup**: Azure Resource Group for deployment. (Required)

### Steps:

1. **Checkout**: Initializes the workspace with the repository content.
2. **Azure Login**: Authenticates the workflow with Azure.
3. **Install GitVersion**: Retrieves and sets up GitVersion.
4. **Determine Version**: Uses GitVersion to determine the semantic versioning of the code.
5. **Tag the repo**: Tags the repository with the determined version.
6. **Replace tokens**: Replaces tokens in the parameter file for Bicep.
7. **Copy template**: Copies the Bicep template to a designated workspace for artifacts.
8. **Copy parameters**: Copies the Bicep parameters to the artifact workspace.
9. **Publish artifacts**: Publishes the template and parameter artifacts.
10. **Adjust directive in parameters file**: Modifies the path in the parameters file to match the artifact structure.
11. **Move files and update references**: Adjusts the location and references of the Bicep files.
12. **Deploy using the artifact**: Deploys the resources using the Azure CLI.

---

## 2. **Workflow: Validate & Deploy**

### Triggers:

- **push** to the "master" branch.
- **pull_request** targeting the "master" branch.
- Manual **workflow_dispatch**.

### Environment Variables:

- **ENVIRONMENT**: 'int'
- **TEMPLATE_FILE**: 'main'
- **LOCATION**: 'we'
- **RESOURCE_GROUP**: 'Test-Lab'

### Jobs:

1. **deploy**:
   - Environment: int
   - Runs on: ubuntu-latest
   - **Steps**:
     1. **Checkout**: Initializes the workspace with the repository content.
     2. **Deploy using Bicep**: Uses the main Bicep action to deploy the resources.

---

## 3. **Bicep Code**

### Parameter Files:

The parameter files define the input values required for the Bicep template.

**File**: `parameters\int\main_we.bicepparam`

- Uses the main Bicep template.
- Defines values for purpose, location, environment, address prefixes, subnet prefix, and version details from the Git repository.

### Template Files:

The template files contain the actual resource declarations and the logic for deployment.

**File**: `templates/main.bicep`

- Defines parameters for the deployment such as purpose, location, environment, address prefixes, etc.
- Deploys a network module from the specified Azure Container Registry.

---

## Conclusion

This repository provides an automated, modular approach to deploying Azure network resources using Bicep and GitHub actions. By leveraging the flexibility of Bicep and the automation capabilities of GitHub actions, deployments become more streamlined and error-prone aspects are significantly reduced. 

Ensure you've set up the required secrets in your GitHub repository for authentication with Azure. 

**Note**: Always review and adjust configurations to fit the security and compliance needs of your environment.