<#
.SYNOPSIS
Opens a file so it can't be accessed by other applications.
.DESCRIPTION
Useful for debugging sharing violations.
.PARAMETER Path
File to lock
.INPUTS
System.IO.FileInfo
File path
#>
function Lock-File {
    [CmdletBinding()]
    param (
        # File to lock
        [System.IO.FileInfo]
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true)]
        $Path
    )
    $file = [System.IO.File]::OpenWrite($Path)
    # Write-Host $Checksum
    Write-Host "Press any key to unlock file..."
    # Wait for user input
    $HOST.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | OUT-NULL
    # Clear the key that was pressed from the console
    $HOST.UI.RawUI.Flushinputbuffer()
    $file.Close();
}

Export-ModuleMember -Function Lock-File