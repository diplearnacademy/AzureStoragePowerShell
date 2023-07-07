# Laboratorio: Cómo subir archivos a un contenedor en Azure utilizando PowerShell en 5 pasos

**Objetivo** El objetivo de este laboratorio es aprender cómo subir archivos a un contenedor en Azure utilizando PowerShell.

**Requisitos previos**

- Tener instalada la versión más reciente de PowerShell.
- Contar con una cuenta de Azure.

**Pasos**

1. Abre PowerShell en tu computadora. Puedes buscar "PowerShell" en el menú Inicio o presionar las teclas "Win + X" y seleccionar "Windows PowerShell" o "Windows PowerShell (Admin)" si deseas ejecutarlo como administrador.
1. Una vez que tengas PowerShell abierto, ejecuta el siguiente comando para instalar el módulo de Azure:

```Install-Module -Name Az -AllowClobber -Scope CurrentUser```

Este comando instalará el módulo de Azure (**Az**) en tu perfil de usuario.

1. Durante la instalación, se te pedirá confirmación para instalar el módulo desde el repositorio de NuGet. Presiona "Y" y luego "Enter" para confirmar.
1. PowerShell descargará e instalará el módulo de Azure junto con sus dependencias. Este proceso puede llevar un tiempo dependiendo de la velocidad de tu conexión a Internet.
1. Una vez que se complete la instalación, puedes importar el módulo de Azure ejecutando el siguiente comando:

```Import-Module Az```

Esto cargará el módulo de Azure en tu sesión actual de PowerShell.

Ahora estás listo para utilizar los cmdlets y comandos proporcionados por el módulo de Azure en PowerShell. Puedes comenzar a administrar tus recursos de Azure utilizando los comandos disponibles.

**Paso 1: Conexión a la cuenta de Azure** Para comenzar, debemos conectarnos a nuestra cuenta de Azure utilizando el siguiente comando en PowerShell:

```Connect-AzAccount```

**Paso 2: Creación de un grupo de recursos** A continuación, crearemos un grupo de recursos en Azure utilizando el siguiente comando:

```New-AzResourceGroup -Name Example-powershell -Location 'East US 2' ```

![](Images/Aspose.Words.95b7c4b1-67f1-4aad-a5e2-cd2687aa9ba5.001.png)

**Paso 3: Creación de una cuenta de almacenamiento** Ahora, crearemos una cuenta de almacenamiento en Azure utilizando el siguiente comando:

```New-AzStorageAccount -ResourceGroupName Example-powershell -Name dlstoragepowershell -SkuName Standard\_LRS -Location 'East US 2' -Kind StorageV2 ```

![](Images/Aspose.Words.95b7c4b1-67f1-4aad-a5e2-cd2687aa9ba5.002.png)

**Paso 4: Creación de un contenedor en la cuenta de almacenamiento** En este paso, crearemos un contenedor en la cuenta de almacenamiento utilizando los siguientes comandos:

```$storageaccountname = "dlstoragepowershell" 

$containername = "files" 

$resourcegroup = "Example-powershell" 

\# Obtener el contexto de la cuenta de almacenamiento de Azure 

$storagecontext = (Get-AzStorageAccount -ResourceGroupName $resourcegroup -Name $storageaccountname).Context 

\# Crear un nuevo contenedor 

New-AzStorageContainer -Name $containername -Context $storagecontext ```

![](Images/Aspose.Words.95b7c4b1-67f1-4aad-a5e2-cd2687aa9ba5.003.png)

**Paso 5: Subida de archivos al contenedor** Existen dos versiones para subir los archivos al contenedor. Puedes elegir la versión que mejor se adapte a tus necesidades.

**Versión 1: Subir un archivo individual** Si deseas subir un único archivo al contenedor, utiliza el siguiente comando:

```Set-AzStorageBlobContent -File "Ruta\al\archivo.txt" -Context $storagecontext -Blob "NombreArchivo.txt" -Container $containername ```

![](Images/Aspose.Words.95b7c4b1-67f1-4aad-a5e2-cd2687aa9ba5.004.png)

**Versión 2: Subir múltiples archivos** Si deseas subir varios archivos de una vez, utiliza el siguiente comando:

```$files = Get-ChildItem -Path "Ruta\al\directorio" 

foreach ($file in $files) { Set-AzStorageBlobContent -File $file.FullName -Context $storagecontext -Blob $file.BaseName -Container $containername -Force }```

![](Images/Aspose.Words.95b7c4b1-67f1-4aad-a5e2-cd2687aa9ba5.005.png) 

¡Enhorabuena! Has completado exitosamente el laboratorio de subida de archivos a un contenedor en Azure utilizando PowerShell.

