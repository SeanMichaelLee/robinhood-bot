$location = "eastus"
$project_prefix = "stocks-bot"
$storage = "stocksbotsa"
$functionsVersion = "4"
$pythonVersion = "3.9" #Allowed values: 3.7, 3.8, and 3.9

# Install Azure AZ this command must be ran as Admin
Install-Module -Name Az
Install-Module -Name Az.Storage

# Log into Azure Portal Account
Connect-AzAccount

# Call Set-AzContext here if you'd like to use another subscription than the default

# Create infra for stocks bot (i.e. resource group, key vault, storage account, and Azure function)
New-AzResourceGroup -Name ($project_prefix + "-rg") -Location $location
New-AzKeyVault -Name ($project_prefix + "-kv") -ResourceGroupName ($project_prefix + "-rg") -Location $location
Register-AzResourceProvider -ProviderNamespace "Microsoft.Storage"
New-AzStorageAccount -Name $storage -Location $location -ResourceGroupName ($project_prefix + "-rg") -SkuName "Standard_LRS"
New-AzFunctionApp -Name ($project_prefix + "-function-app") -StorageAccountName $storage -Location $location -ResourceGroupName ($project_prefix + "-rg") -OSType Linux -Runtime Python -RuntimeVersion $pythonVersion -FunctionsVersion $functionsVersion -IdentityType SystemAssigned

# Give Azure Function get Access to the Key Vault
$id = (Get-AzADServicePrincipal -DisplayName ($project_prefix + "-function-app")).AppId
Set-AzKeyVaultAccessPolicy -VaultName ($project_prefix + "-kv") -ResourceGroupName ($project_prefix + "-rg") -ServicePrincipalName $id -PermissionsToSecrets get
