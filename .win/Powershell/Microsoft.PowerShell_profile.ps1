if ($IsWindows) {
    Set-Location "C:\Users\RRoach\.dot"

    # Chocolatey profile
    $ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
    if (Test-Path($ChocolateyProfile)) {
        Import-Module "$ChocolateyProfile"
    }
    $dot = 'C:\Users\RRoach\.dot'
    $docs = 'C:\Users\RRoach\Documents\'
    $gh = 'C:\Users\RRoach\Documents\OneDrive - IMODULES SOFTWARE\Projects\Github'
    $ida = 'C:\Users\RRoach\Documents\OneDrive - IMODULES SOFTWARE\Projects\internaldataanalytics'
    $oned = 'C:\Users\RRoach\Documents\OneDrive - IMODULES SOFTWARE\'
    $desk = 'C:\Users\RRoach\Desktop\'
    $proj = 'C:\Users\RRoach\Documents\OneDrive - IMODULES SOFTWARE\Projects\'
    $nvd = 'C:\Users\RRoach\AppData\Local\nvim'
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
Set-Theme riley ; if ($?) {
    Set-Theme riley
}
else {
    Set-Theme Avit
}


## // handy aliases
# // git
function git-commit {
    git commit $args
}
Set-Alias -name 'gt' git-commit

function git-remote-update {
    git remote update $args
}
Set-Alias -name 'grup' git-remote-update

function git-status {
    git status $args
}
Set-Alias -name 'gs' git-status

# // other
Set-Alias -name 'rr' -value 'radian'
Set-Alias -name 'r' -value 'Rscript'
Set-Alias -name 'l' -value Get-ChildItemColor
Set-Alias -name 'which' -value Get-Command

