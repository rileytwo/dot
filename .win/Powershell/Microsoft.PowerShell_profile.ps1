if ($IsWindows) {
    Set-Location "C:\Users\RRoach\.dot"

    # Chocolatey profile
    $ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
    if (Test-Path($ChocolateyProfile)) {
        Import-Module "$ChocolateyProfile"
    }

    $env:PSModulePath += ";C:\Users\RRoach\scoop\modules"
    $Env:Path += ";C:\ProgramData\jetpack\bin"

    function Start-Conda {
        (& "C:\Users\RRoach\scoop\apps\miniconda3\current\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression
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

if (Get-Module "Get-ChildItemColor") {
    Import-Module Get-ChildItemColor
}
if (Get-Module "posh-git") {
    Import-Module posh-git
}
if (Get-Module "oh-my-posh") {
    Import-Module oh-my-posh -DisableNameChecking
}
if (Get-Module "ZLocation") {
    Import-Module ZLocation
}

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
Set-Alias -name 'l' -value Get-ChildItemColor
Set-Alias -name 'which' -value Get-Command
#
# // git
function Send-GitCommit {
    git commit $args
}
Set-Alias -name 'gt' Send-GitCommit

function Get-GitRemoteUpdate {
    git remote update $args
}
Set-Alias -name 'grup' Get-GitRemoteUpdate

function Get-GitRepositoryStatus {
    git status $args
}
Set-Alias -name 'gs' Get-GitRepositoryStatus
#
# // other
Set-Alias -name 'rr' -value 'radian'
Set-Alias -name 'r' -value 'Rscript'


