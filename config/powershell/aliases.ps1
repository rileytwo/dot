#!/usr/bin/env pwsh

if ($IsWindows) {
    Set-Alias -name 'wslpath' -Value Get-WSLPath
    function Get-WSLPath {
        $strlit = '"'
        wsl wslpath $strlit$args$strlit
    }
    
    Set-Alias -name 'exa' -Value Get-ChildItemExa
    function Get-ChildItemExa {
        wsl exa $args
    }
    
    Set-Alias -name 'ee' -Value Get-ChildItemExa_lhF
    function Get-ChildItemExa_lhF {
        wsl exa -lhF
    }
    
    Set-Alias -name 'e' -Value Get-ChildItemExa_lahF
    function Get-ChildItemExa_lahF {
        wsl exa -lahF
    }
    
    Set-Alias -name 'eg' -Value Get-ChildItemExa_lahF__git
    function Get-ChildItemExa_lahF__git {
        wsl exa -lahF --git
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
Set-Alias -Name 'r' -Value 'Rscript'