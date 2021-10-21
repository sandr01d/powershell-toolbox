﻿#
# Module manifest for module 'Powershell-Toolbox'
#
# Generated by: Sandroid
#
# Generated on: 10/15/2021
#

@{

# Script module or binary module file associated with this manifest.
# RootModule = ''

# Version number of this module.
ModuleVersion = '0.1.0'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = '2182fda3-227f-4b70-aefb-448e0c85fc1d'

# Author of this module
Author = 'Sandroid'

# Copyright statement for this module
Copyright = '(c) Sandroid. The MIT license'

# Description of the functionality provided by this module
Description = 'A collection of useful Powershell Cmdlets'

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @(
    '.\Remove-Junk\Remove-Junk.psm1',
    '.\Switch-DarkMode\Switch-DarkMode.psm1',
    '.\Confirm-Checksum\Confirm-Checksum.psm1'
    )

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @("Remove-Junk", "Switch-DarkMode", "Confirm-Checksum")

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = ''

# Variables to export from this module
VariablesToExport = ''

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = ''
}
