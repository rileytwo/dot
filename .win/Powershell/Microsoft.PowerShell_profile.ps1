Set-Location "C:\Users\RRoach\.dot"
$PSDefaultParameterValues = @{
    "Format-Table:Autosize" = $True 
}
    
#winfetch

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}


#function git_status {
#    git status
#}

#function git_status_b {
#    git status -sb
#}

#function git_commit {
#    git commit
#}

#function git_remote_update {
#    git remote update
#}


### module imports ###
Import-Module Get-ChildItemColor
#Import-Module posh-git
Import-Module oh-my-posh -DisableNameChecking
Set-Theme riley

#try { $null = gcm pshazz -ea stop; pshazz init 'default' } catch { }
#pshazz use kiedtl

### handy aliases ###

#Set-Alias -name 'trash' -value 'empty-recycle-bin'

Set-Alias -name 'rr' -value 'radian'
Set-Alias -name 'r' -value 'Rscript'
Set-Alias -name 'ttx' -value '~/.dot/usr/ttx.R'


Set-Alias -name 'gs' -value 'git_status'
Set-Alias -name 'gt' -value 'git_commit'
Set-Alias -name 'gsb' -value 'git_status_b'
Set-Alias -name 'grup' -value 'git_remote_update'

Set-Alias -name 'l' -value Get-ChildItemColor

Set-Alias -name 'which' -value Get-Command

$dot = 'C:\Users\RRoach\.dot'
$Documents = $docs = 'C:\Users\RRoach\Documents\'
$GitHub = $gh = 'C:\Users\RRoach\Documents\OneDrive - IMODULES SOFTWARE\Projects\Github'
$internaldataanalytics = $ida = 'C:\Users\RRoach\Documents\OneDrive - IMODULES SOFTWARE\Projects\internaldataanalytics'
$OneDrive = $oned = $od = 'C:\Users\RRoach\Documents\OneDrive - IMODULES SOFTWARE\'
$Desktop = $desk = $dt = 'C:\Users\RRoach\Desktop\'
$Projects = $proj = $pj = 'C:\Users\RRoach\Documents\OneDrive - IMODULES SOFTWARE\Projects\'

$nvd = 'C:\Users\RRoach\AppData\Local\nvim'

