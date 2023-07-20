<#
.SYNOPSIS
Installs packages defined in the package file using winget
.PARAMETER PackageFile
The file that defines which packages will be installed
.INPUTS
Package file path
.EXAMPLE
Install-Bulk -PackageFile .\path\to\file.json
#>
function Install-Bulk {
    [CmdletBinding()]
    param (
        [System.IO.FileInfo]
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true)]
        $PackageFile
    )
    # Fetch the packages from the json file
    $Json = Get-Content -Path $PackageFile | ConvertFrom-Json
    foreach ($Package in $Json.winget) {
        winget install --accept-source-agreements --accept-package-agreements --exact --id $Package --source winget
    }
    foreach ($Package in $Json.store) {
        # The msstore source uses unique identifiers as the "Id" for packages.
        # These do not require the exact query option.
        winget install --accept-source-agreements --accept-package-agreements $Package -s msstore
    }
}

Export-ModuleMember -Function Install-Bulk
