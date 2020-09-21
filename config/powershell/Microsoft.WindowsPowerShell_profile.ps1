### some options
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete


function prompt { 
    "$PWD `r`n> "
}
