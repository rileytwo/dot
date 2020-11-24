### some options
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete



function prompt {
    $PathBar = "$([char]27)[35m$PWD$([char]27)[0m"
    "$PathBar`r`n> "
}
