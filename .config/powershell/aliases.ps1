#!/usr/bin/env pwsh

function Get-Path {
    if ($IsWindows) { $env:PATH.Split(';') } else { $env:PATH.Split(':') }
}

function Get-ChildItemColorForce { Get-ChildItemColor -Path "$args" -Force }

function Get-GitRepositoryStatus { git status $args }
function Get-GitConfigGlobal { git config --global --list }
function Get-GitConfigLocal { git config --local --list }

Set-Alias -Name 'which' -Value Get-Command
Set-Alias -Name 'path' -Value Get-Path
Set-Alias -Name 'l' -Value Get-ChildItemColorForce
Set-Alias -Name 'gngl' Get-GitConfigGlobal
Set-Alias -Name 'gnll' Get-GitConfigLocal
Set-Alias -Name 'gs' Get-GitRepositoryStatus
Set-Alias -Name 'rr' -Value 'radian'
Set-Alias -Name 'r' -Value 'Rscript'

Write-Output "Done!"