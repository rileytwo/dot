#!/usr/bin/env pwsh

if ($IsWindows) {
    # Maybe add a "Write-WSLError" function ?
    function Get-WSL() {
        try {
            Get-Command wsl -ErrorAction:SilentlyContinue >$null 2>&1
        }
        catch [System.Management.Automation.CommandNotFoundException] {
            continue
        }
    }
    Get-WSL -ErrorAction:SilentlyContinue

    Set-Alias -Name 'wslpath' -Value Get-WSLPath
    function Get-WSLPath($pathWin) {
        if (!$pathWin) {
            [string]$pathWin = $(Get-Location)
        }
        else {
            [string]$pathWin = $(Get-Item -Force -Path $pathWin)
        }

        $pathWin = $pathWin.Replace('\', '/')
        $pathWin = $(wsl wslpath $pathWin)

        return $pathWin
    }

    Set-Alias -Name 'exa' -Value Get-ChildItemExa
    function Get-ChildItemExa($pathWin) {
        wsl exa $(Get-WSLPath -pathWin $pathWin) "$args"
    }

    Set-Alias -Name 'ee' -Value Get-ChildItemExa_lhF
    function Get-ChildItemExa_lhF {
        Get-ChildItemExa -pathWin "$args" -lhF
    }

    Set-Alias -Name 'e' -Value Get-ChildItemExa_lahF
    function Get-ChildItemExa_lahF {
        Get-ChildItemExa -pathWin "$args" -lahF
    }
}

Set-Alias -Name 'path' -Value Get-Path
function Get-Path {
    if ($IsWindows) {
        $env:PATH.Split(';')
    } else {
        $env:PATH.Split(':')
    }
}


Set-Alias -Name 'which' -Value Get-Command
Set-Alias -Name 'rr' -Value 'radian'


Set-Alias -Name 'gcd' -Value Set-GitBranch_Dev
function Set-GitBranch_Dev {
    git checkout dev
}

Set-Alias -Name 'gcm' -Value Set-GitBranch_Main
function set-GitBranch_Main {
    git checkout main
}

Set-Alias -Name 'gs' Get-GitRepositoryStatus
function Get-GitRepositoryStatus {
    git status $args
}

Set-Alias -Name 'gngl' -Value Get-GitConfigGlobal
function Get-GitConfigGlobal {
    git config --global --list
}


Set-Alias -Name 'gnll' -Value Get-GitConfigLocal
function Get-GitConfigLocal {
    git config --local --list
}

Set-Alias -Name 'l' -Value Get-ChildItemColorForce
function Get-ChildItemColorForce {
    Get-ChildItemColor -Path "$args" -Force
}


Set-Alias -Name 'assoc' -Value Get-FileAssociations
function Get-FileAssociations {
    cmd /c assoc $args
}

Set-Alias -Name ftype -Value Get-FileTypes
function Get-FileTypes {
    cmd /c ftype $args
}