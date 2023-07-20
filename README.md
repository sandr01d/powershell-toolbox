# Powershell-Toolbox

A collection of powershell modules I personally use, to make my life easier. Further information about the cmdlets can be displayed using the ``Get-Help`` cmdlet.

## :information_source: Regarding JSON with comments (JSONC)

Some example files of this repository are using the JSONC format to showcase what specific options in the config files do. [PowerShell Core](https://github.com/PowerShell/PowerShell) can handle the JSONC file format, Windows PowerShell does not. So you have to either use PowerShell Core or use regular JSON files without the comments.

## Confirm-Checksum

Supported Platforms: Cross Platform  
Tested on: Linux, Windows

Verifies a files checksum. Useful for verifying integrity of files downloaded from the internet.

## Install-Bulk

Supported Platforms: Windows  
Tested on: Windows  

Installs a list of packages defined in a JSON file. The IDs of the packages have to match exactly. An example file can be found [here](Install-Bulk/packages.jsonc).

## Lock-File

Supported Platforms: Cross Platform  
Tested on: Windows

Opens a file so it can't be accessed by other applications. Useful for debugging sharing violations.

## Remove-Junk

Supported Platforms: Windows  
Tested on: Windows

Removes a list of packages defined in JSON format. Wildcards are allowed. An example file can be found [here](Remove-Junk/packages.json).


## Switch-DarkMode

Supported Platforms: Windows  
Tested on: Windows

Switches the system wide dark mode on or off (depending on the current state).
