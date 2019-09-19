#!/usr/bin/env pwsh


param(
    [string]$name = "",
    [string]$new = ""
)

function _find() {
    Get-ChildItem -Recurse -Filter *$name*
}