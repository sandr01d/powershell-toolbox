<#
.SYNOPSIS
Switches the system-wide dark mode to the state it currently does not have.
.EXAMPLE
PS> Switch-DarkMode
#>
function Switch-DarkMode {
    $Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
    $Name = "AppsUseLightTheme"
    $Property = Get-ItemProperty -Path $Path -Name $Name
    Set-ItemProperty -Path $Path -Name $Name -Value $(If ($Property.AppsUseLightTheme) {0} Else {1})
}

Export-ModuleMember -Function Switch-DarkMode