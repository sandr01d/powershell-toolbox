<#
.SYNOPSIS
Removes the AppXPackage (Windows Store applications) if present
.PARAMETER PackageName
The name of the package to remove
.PARAMETER DryRun
If set to true, only the names of the apps are printed, but nothing is removed.
#>
function Remove-Package {
    param (
        # Name of the package to remove
        [string]
        [Parameter(Mandatory = $true)]
        $PackageName,
        [Parameter(Mandatory = $true)]
        [bool]
        $DryRun = $false
    )
    
    $Package = Get-AppxPackage -Name $PackageName
    if ($null -ne $Package) {
        Write-Host Removing $Package.Name -ForegroundColor Green
        if (!$DryRun) {
            Remove-AppxPackage $Package
        }
    }
    else {
        Write-Host "A package that matches '$PackageName' could not be found"`
        -ForegroundColor Yellow
    }
}

<#
.SYNOPSIS
Removes the package (regular program) if present
.PARAMETER PackageName
The name of the package to remove
.PARAMETER DryRun
If set to true, only the names of the apps are printed, but nothing is removed.
#>
function Remove-Program {
    param (
        # Name of the program to remove
        [string]
        [Parameter(Mandatory = $true)]
        $ProgramName,
        [Parameter(Mandatory = $true)]
        [bool]
        $DryRun = $false
    )
    
    $program = Get-Package -ProviderName Programs -IncludeWindowsInstaller |
    Where-Object { $_.Name -like $ProgramName }
    
    if ($null -ne $program) {
        Write-Host Removing $program.Name -ForegroundColor Green
        if (!$DryRun) {
            $program.Uninstall()
        }
    }
    else {
        Write-Host "A program that matches '$ProgramName'`
        could not be found" -ForegroundColor Yellow
    }
}

<#
.SYNOPSIS
Removes unwanted programs
.DESCRIPTION
Removes the packages and AppXPackages defined
in the packages.json file (if the exist on this computer)
.PARAMETER PackageFile
The path to the packages.json file, containing the apps to remove.
.PARAMETER DryRun
If set to true, only the names of the apps are printed, but nothing is removed.
.INPUTS
None. You can not pipe objects to Remove-Junk
.OUTPUTS
None
.EXAMPLE
PS> Remove-Junk -PackageFile .\packages.json -DryRun
#>
function Remove-Junk {
    [CmdletBinding()]
    param (
        [System.IO.FileInfo]
        [Parameter(Mandatory = $true)]
        $PackageFile,
        [System.Management.Automation.SwitchParameter]
        $DryRun = $false
    )
    
    # Fetch the packages/programs that shall be removed from the json file
    $json = Get-Content -Path $PackageFile | ConvertFrom-Json

    # Iterate over all packages and remove them
    foreach ($PackageName in $json.packages) {
        Remove-Package -PackageName $PackageName -DryRun $DryRun
    }

    # Iterate over all programs and remove them
    foreach ($ProgramName in $json.programs) {
        Remove-Program -programName $ProgramName -dryRun $DryRun
    }
}

Export-ModuleMember -Function Remove-Junk
