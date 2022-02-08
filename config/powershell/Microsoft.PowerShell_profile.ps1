### some options
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -Colors @{
    "Command"   = "`e[34m"
    "Parameter" = "`e[35m"
    "String"    = "`e[33m"
    "Operator"  = "`e[33m"
    "InlinePrediction" = "`e[38;5;8m"
}
Set-PSReadLineKeyHandler -Key "Tab" -Function MenuComplete
Set-PSReadLineKeyHandler -Chord "Ctrl+RightArrow" -Function ForwardWord
Set-PSReadLineKeyHandler -Chord "Ctrl+LeftArrow" -Function BackwardWord


### OS special things
if ($IsWindows) {
    $ChocolateyProfile = "${env:ChocolateyInstall}/helpers/chocolateyProfile.psm1"
    if (Test-Path($ChocolateyProfile)) {
        Import-Module "$ChocolateyProfile"
    }

    if (Test-Path("${HOME}/scoop/modules")) {
        $env:PSModulePath = "${HOME}/scoop/modules;${env:PSModulePath}"
    }

    if (Test-Path("${HOME}/AppData/Local/Programs/Microsoft VS Code/bin")) {
        $env:PATH = "${HOME}/AppData/Local/Programs/Microsoft VS Code/bin;${env:PATH}"
    }
}


## inherit /etc/paths on macOS
if ($IsMacOS) {
    $env:PATH = (/usr/libexec/path_helper).Split('"')[1]
}


## user-defined paths
function Add-UserPaths([string[]] $Paths) {
    foreach ($Path in $Paths) {
        if (Test-Path $Path) {
            switch($IsWindows) {
                $True   { $Sep = ";" }
                default { $Sep = ":" }
            }
            $env:PATH = ($env:PATH).Insert(0, "${Path}${Sep}")
        }
    }
}

Add-UserPaths -Paths @(
    "$HOME/bin",
    "$HOME/.local/bin",
    "$HOME/.pyenv/bin",
    "$HOME/.pyenv/shims",
    "$HOME/.rbenv/bin",
    "$HOME/.rbenv/shims"
)


### modules
# (TODO: maybe use a hashtable with modules and args?
function Import-UserModules([string[]] $Modules) {
    $Loaded = @()
    Remove-PSReadLineKeyHandler 'Ctrl+r'
    foreach ($Module in $Modules) {
        if (Get-Module -ListAvailable $Module) {
            Import-Module $Module -DisableNameChecking
            $Loaded += $Module
        }
    }
}

Import-UserModules -Modules @(
    "Get-ChildItemColor",
    "posh-git",
    "oh-my-posh",
    "PSFzf",
    "git-aliases"
)


### executables/cli tools
if (Get-Command "rg" -ErrorAction SilentlyContinue) {
    $env:RIPGREP_CONFIG_PATH = "~/.config/ripgrep/ripgreprc"
    $env:FZF_DEFAULT_COMMAND = "rg --files --no-ignore-vcs --hidden"
}



# // set theme
function Set-UserTheme([string] $Theme) {
    if (Get-Command "oh-my-posh" -ErrorAction SilentlyContinue) {
        oh-my-posh --init --shell pwsh --config "~/.dot/config/powershell/PoshThemes/$Theme.omp.json" | Invoke-Expression
    }
    else {
        if ($ThemeSettings) {
            if (Test-Path "$($ThemeSettings.MyThemesLocation)/$Theme.psm1") {
                Set-Theme $Theme
            }
            else {
                # Set a default oh-my-posh theme if riley.psm1 {is,was}n't set
                Set-Theme Avit
            }
        }
    }
}

Set-UserTheme -Theme riley



### aliases
if (Test-Path "$((get-item $profile).DirectoryName)/aliases.ps1") {
    . "$((get-item $profile).DirectoryName)/aliases.ps1"
}