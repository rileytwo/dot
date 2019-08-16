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
        (& "C:\Users\RRoach\scoop\apps\miniconda3\current\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression
    }
    if (Get-VirtualEnvName) {
        $Env:CONDA_PROMPT_MODIFIER = ""
    }
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
    Remove-PSReadlineKeyHandler 'Ctrl+r'
    Import-Module PSFzf
    $Env:FZF_DEFAULT_COMMAND = "rg --files --no-ignore-vcs --hidden"
}
if (Get-Module -ListAvailable "git-aliases") {
    Import-Module git-aliases -DisableNameChecking
}
Invoke-Expression ($(
        lua "C:\Users\RRoach\github\z\z.lua" --init powershell
    ) -join "`n"
) 


Set-Theme riley ; if ($?) {
    Set-Theme riley
}
else {
    Set-Theme Avit
}


## // handy aliases
#
# // general
function Get-Path {
    $Env:Path.Split(';')
}
Set-Alias -name 'path' -value Get-Path

Remove-Item alias:where -Force
function Get-Commands {
    cmd /c where $args
}
Set-Alias -name 'where' -value Get-Commands
Set-Alias -name 'which' -value Get-Command
Set-Alias -name 'l' -value Get-ChildItemColor


#
# // git
function Get-GitRepositoryStatus {
    git status $args
}
Set-Alias -name 'gs' Get-GitRepositoryStatus
#
# // other
Set-Alias -name 'rr' -value 'radian'
Set-Alias -name 'r' -value 'Rscript'


