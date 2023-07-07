$files = Get-ChildItem -Path "Ruta\al\directorio" 
foreach ($file in $files) { Set-AzStorageBlobContent -File $file.FullName -Context $storagecontext -Blob $file.BaseName -Container $containername -Force }
