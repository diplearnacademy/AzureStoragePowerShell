$storageaccountname = "dlstoragepowershell" 
$containername = "files" 
$resourcegroup = "Example-powershell" 
# Obtener el contexto de la cuenta de almacenamiento de Azure 
$storagecontext = (Get-AzStorageAccount -ResourceGroupName $resourcegroup -Name $storageaccountname).Context 
# Crear un nuevo contenedor 
New-AzStorageContainer -Name $containername -Context $storagecontext 
