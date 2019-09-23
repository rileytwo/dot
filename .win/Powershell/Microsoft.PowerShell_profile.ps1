if ($IsWindows) {
    # Chocolatey profile
    $ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
    if (Test-Path($ChocolateyProfile)) {
        Import-Module "$ChocolateyProfile"
    }

    $Env:PSModulePath += ";C:\Users\RRoach\scoop\modules"
    $Env:Path += ";C:\ProgramData\jetpack\bin"
    $Env:Path += ";C:\Users\RRoach\.cargo\bin"

    function Start-Conda {
        (& "C:\Users\RRoach\scoop\apps\miniconda3\current\Scripts\conda.exe" "shell.powershell" "hook") | 
        Out-String | 
        Invoke-Expression
    }
    if (Get-VirtualEnvName) {
        $Env:CONDA_PROMPT_MODIFIER = ""
    }
    Invoke-Expression (
        $(lua "C:\Users\RRoach\github\z\z.lua" --init powershell enhanced) -join "`n"
    )

}

Set-PSReadLineOption -Colors @{
    "Command"   = "`e[34m"
    "Parameter" = "`e[35m"
    "String"    = "`e[33m"
    "Operator"  = "`e[33m"
}

$PSDefaultParameterValues = @{
    "Format-Table:Autosize" = $True
}


# // module imports
# (TODO: there has to be a better way than checking each module
# before importing)

function Get-Modules {
    # look more into this:
    # gci $env:PSModulePath.Split(':')
    # | Where-Object { $_.Name -match "Micro" }
    if (Get-Module "Get-ChildItemColor") {
        Import-Module Get-ChildItemColor
    }
    if (Get-Module "posh-git") {
        Import-Module posh-git
    }
    if (Get-Module "oh-my-posh") {
        Import-Module oh-my-posh -DisableNameChecking
    }
    if (Get-Module -ListAvailable "PSFzf") {
        Remove-PSReadLineKeyHandler 'Ctrl+r'
        Import-Module PSFzf
        $Env:FZF_DEFAULT_COMMAND = "rg --files --no-ignore-vcs --hidden"
    }
    if (Get-Module -ListAvailable "git-aliases") {
        Import-Module git-aliases -DisableNameChecking
    }
}

Get-Modules


function Set-MyTheme {
    if (Test-Path -IsValid "$($ThemeSettings.MyThemesLocation)/riley.psm1") {
        Set-Theme riley
    }
    else {
        Set-Theme Avit
    }
}

Set-MyTheme

## // handy aliases
#
# // general
Set-Alias -Name 'which' -value Get-Command
Set-Alias -Name 'l' -value Get-ChildItemColor

function Get-Path {
    $Env:Path.Split(';')
}
Set-Alias -Name 'path' -value Get-Path

Remove-Item alias:where -Force
function Get-Commands {
    cmd /c where $args
}
Set-Alias -Name 'where' -value Get-Commands



#
# // git
function Get-GitRepositoryStatus {
    git status $args
}
Set-Alias -Name 'gs' Get-GitRepositoryStatus
#
# // other
Set-Alias -Name 'rr' -value 'radian'
Set-Alias -Name 'r' -value 'Rscript'


