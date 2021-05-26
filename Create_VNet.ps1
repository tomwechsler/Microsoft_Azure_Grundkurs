Set-Location c:\
Clear-Host

#Optional
Get-ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

#Install the module
Install-Module -Name Az -Force -AllowClobber -Verbose

#Connect to the Azure Portal
Connect-AzAccount

#Did it work?
Get-AzSubscription

#Create a resource group
New-AzResourceGroup -Name myResourceGroup -Location WestEurope

#Create the virtual network
$virtualNetwork = New-AzVirtualNetwork `
  -ResourceGroupName myResourceGroup `
  -Location WestEurope `
  -Name myVirtualNetwork `
  -AddressPrefix 192.168.0.0/16

#Add a subnet
$subnetConfig = Add-AzVirtualNetworkSubnetConfig `
  -Name Production `
  -AddressPrefix 192.168.3.0/24 `
  -VirtualNetwork $virtualNetwork

#Associate the subnet to the virtual network
$virtualNetwork | Set-AzVirtualNetwork