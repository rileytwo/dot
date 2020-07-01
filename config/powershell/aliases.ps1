#!/usr/bin/env pwsh

if ($IsWindows) {
    Set-Alias -Name 'wslpath' -Value Get-WSLPath
    function Get-WSLPath($pathWin) {
        if (!$pathWin) {
            $pathWin = $(Get-Location)
        }

        [string]$pathWin = Get-Item -Force -Path ${pathWin}

        $pathWin = $pathWin.Replace('\','/')
        $pathWin = $(wsl wslpath $pathWin)

        Return $pathWin
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

Set-Alias -Name 'l' -Value Get-ChildItemColorForce
function Get-ChildItemColorForce {
     Get-ChildItemColor -Path "$args" -Force 
}


Set-Alias -Name 'gs' Get-GitRepositoryStatus
function Get-GitRepositoryStatus { 
    git status $args 
}


Set-Alias -Name 'gngl' Get-GitConfigGlobal
function Get-GitConfigGlobal { 
    git config --global --list 
}


Set-Alias -Name 'gnll' Get-GitConfigLocal
function Get-GitConfigLocal { 
    git config --local --list 
}

Set-Alias -Name 'which' -Value Get-Command
Set-Alias -Name 'rr' -Value 'radian'