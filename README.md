# Powershell-Toolbox

A collection of powershell modules I personally use, to make my life easier. Further information about the cmdlets can be displayed using the ``Get-Help`` cmdlet.

## Usage

To use the cmdlets, you have to clone this repository and import the module:

```powershell
# Clone this repository
git clone https://github.com/sandr01d/powershell-toolbox.git
# Go into the repositories root folder
cd .\powershell-toolbox
# By default PowerShell only allows importing modules that were signed with a trusted key.
# You'll have to change that to be able to import this module (or sign the module yourself).
# Allowing only the current process to bypass this restriction is the least invasive.
Set-ExecutionPolicy -Scope Process Bypass
# Import the module
Import-Module .\Powershell-Toolbox.psd1
```

## :information_source: Regarding JSON with comments (JSONC)

Some example files of this repository are using the JSONC format to showcase what specific options in the config files do. [PowerShell Core](https://github.com/PowerShell/PowerShell) can handle the JSONC file format, Windows PowerShell does not. So you have to either use PowerShell Core or use regular JSON files without the comments.

## Confirm-Checksum

Supported Platforms: Cross Platform  
Tested on: Linux, Windows

Verifies a files checksum. Useful for verifying integrity of files downloaded from the internet.

## Install-Bulk

Supported Platforms: Windows  
Tested on: Windows  

Installs a list of packages defined in a JSON file. The IDs of the packages have to match exactly. An example file can be found [here](Install-Bulk/packages.jsonc). Winget needs to be installed for this command to work, this is already the case for most Windows installations. You can find more details [here](https://learn.microsoft.com/en-us/windows/package-manager/winget/#install-winget).  
To find the exact names of the packages you want to install, you can search for them with [winget search](https://learn.microsoft.com/en-us/windows/package-manager/winget/search), e.g. `winget search firefox`.

## Lock-File

Supported Platforms: Cross Platform  
Tested on: Windows

Opens a file so it can't be accessed by other applications. Useful for debugging sharing violations.

## Remove-Junk

Supported Platforms: Windows  
Tested on: Windows

Removes a list of packages defined in JSON format. Wildcards are allowed. An example file can be found [here](Remove-Junk/packages.json).  
You can use the `Get-AppxPackage` cmdlet to search for packages installed on your system. Use asterisks (*) as wildcard charaters so you don't have to match the full package name to find it, e.g. `Get-AppxPackage *maps*`.


## Switch-DarkMode

Supported Platforms: Windows  
Tested on: Windows

Switches the system wide dark mode on or off (depending on the current state).
