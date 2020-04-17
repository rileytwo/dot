### some options
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -Colors @{
    "Command"   = "`e[34m"
    "Parameter" = "`e[35m"
    "String"    = "`e[33m"
    "Operator"  = "`e[33m"
}



### OS special things
if ($IsWindows) {
    $ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
    if (Test-Path($ChocolateyProfile)) {
        Import-Module "$ChocolateyProfile"
    }

    $env:PSModulePath += ";${HOME}\scoop\modules"
    $env:Path += ";C:\ProgramData\jetpack\bin"
    $env:Path += ";${HOME}\.cargo\bin"
}


## inherit /etc/paths on macOS
if ($IsMacOS) {
    $env:PATH = (/usr/libexec/path_helper).Split('"')[1]
}


## macOS/linux paths
function Add-Paths {
    $paths = @(
        "$HOME/bin",
        "$HOME/.local/bin",
        "$HOME/.pyenv/bin",
        "$HOME/.pyenv/shims",
        "$HOME/.rbenv/bin"
        "$HOME/.rbenv/shims"
    )

    foreach ($path in $paths) {
        if (Test-Path $path) {
            $env:PATH = ($env:PATH).Insert(0, "${path}:")
        }
    }
}



### modules
# (TODO: maybe use a hashtable with modules and args?
function Get-Modules {
    $modules = @(
        "Get-ChildItemColor",
        "posh-git",
        "oh-my-posh",
        "PSFzf",
        "git-aliases"
    )

    $loaded = @()

    Remove-PSReadLineKeyHandler 'Ctrl+r'

    foreach ($module in $modules) {
        if (Get-Module -ListAvailable $module) {
            Import-Module $module -DisableNameChecking
            $loaded += $module
        }
    }
}

Get-Modules



### executables/cli tools
if (Get-Command "rg") {
    $env:FZF_DEFAULT_COMMAND = "rg --files --no-ignore-vcs --hidden"
}



# // set theme
function Set-MyTheme {
    if ($ThemeSettings) {
        if (Test-Path -IsValid "$($ThemeSettings.MyThemesLocation)/riley.psm1") {
            Set-Theme riley
        }
        else {
            Set-Theme Avit
        }
    }
}

Set-MyTheme



### aliases
function Get-Commands {
    if ($IsWindows) {
        cmd /C "where $args"
    }
    else {
        /usr/bin/which -a $args
    }
}

function Get-Path {
    if ($IsWindows) {
        $env:PATH.Split(';')
    }
    else {
        $env:PATH.Split(':')
    }
}

function Get-ChildItemColorForce {
    Get-ChildItemColor -Path "$args" -Force
}

function Get-GitRepositoryStatus { 
    git status $args
}
function Get-GitConfigGlobal { 
    git config --global --list 
}
function Get-GitConfigLocal { 
    git config --local --list 
}


if (Remove-Item alias:where -Force) {
    Set-Alias -Name 'where' -Value Get-Commands
}
Set-Alias -Name 'which' -Value Get-Command
Set-Alias -Name 'path' -Value Get-Path
Set-Alias -Name 'l' -Value Get-ChildItemColorForce
Set-Alias -Name 'gngl' Get-GitConfigGlobal
Set-Alias -Name 'gnll' Get-GitConfigLocal
Set-Alias -Name 'gs' Get-GitRepositoryStatus
Set-Alias -Name 'rr' -Value 'radian'
Set-Alias -Name 'r' -Value 'Rscript'
