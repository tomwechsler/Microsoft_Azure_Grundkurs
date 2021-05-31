Set-Location c:\
Clear-Host

Install-Module -Name Az -Force -AllowClobber -Verbose

Connect-AzAccount

# Are we connected?
Get-AzResourceGroup

Get-AzLocation | select Location
$location = "westeurope"

# Create a resource group
$resourceGroup = "myResourceGroup1975"
New-AzResourceGroup -Name $resourceGroup -Location $location

# Create a storage account
$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroup `
  -Name "twstorageazure" `
  -SkuName Standard_LRS `
  -Location $location