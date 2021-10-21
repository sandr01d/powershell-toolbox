<#
.SYNOPSIS
Verifies a files checksum
.DESCRIPTION
Useful for verifying integrity of files downloaded from the internet.
.PARAMETER Path
Path to the file that shall be verified
.PARAMETER Algorithm
The algorith used to create the checksum, options are: SHA1, SHA256, SHA384, SHA512 & MD5
.PARAMETER Checksum
The expected result of the hash
.INPUTS
System.String
Checksums can be piped to this Cmdlet
.EXAMPLE
# Basic usage
PS> Confirm-Checksum -Path file.txt -Algorithm SHA256 -Checksum E3B0C44298FC1C149AFBF4C8996FB92427AE41E4649B934CA495991B7852B855
.EXAMPLE
# Test if two files are identical
PS> (Get-FileHash -Path file.txt -Algorithm SHA256).Hash | Confirm-Checksum -Path file1.txt -Algorithm SHA256
#>
function Confirm-Checksum {
    [CmdletBinding()]
    param (
        # Path to the file to be validated
        [System.IO.FileInfo]
        [Parameter(Mandatory = $true)]
        $Path,
        # Algorithm to use
        [Algorithm]
        [Parameter(Mandatory = $true)]
        $Algorithm,
        [string]
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true)]
        $Checksum
    )

    # Write a warning when using an unsecure algorithm
    if ($Algorithm -eq [Algorithm]::SHA1 -or $Algorithm -eq [Algorithm]::MD5) {
        Write-Warning "$Algorithm is considered insecure"
    }

    # Hashes are case insensitive and displayed in upper case by Get-FileHash
    # Make sure they match and look the same when printing out
    $Checksum = $Checksum.ToUpper()
    # Obtain the files hash
    $FileHash = (Get-FileHash -Path $Path -Algorithm $Algorithm).Hash

    if ($FileHash -eq $Checksum) {
        Write-Host "${Path}: OK" -ForegroundColor Green
    }
    else {
        Write-Host "${Path}: FAILED" -ForegroundColor Red
        @(
            @{ FileHash = $FileHash },
            @{ Checksum = $Checksum }
        ) | Format-Table -HideTableHeaders -AutoSize
    }
}

enum Algorithm {
    SHA1 = 0
    SHA256 = 1
    SHA384 = 2
    SHA512 = 3
    MD5 = 4
}

Export-ModuleMember -Function Confirm-Checksum
