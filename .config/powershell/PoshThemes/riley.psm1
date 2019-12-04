#requires -Version 2 -Modules posh-git

function Write-Theme {
    param(
        [bool]$lastCommandFailed,
        [string]$with
    )
    
    # Writes the drive portion
    $drive = "~"
    if ($pwd.Path -ne $HOME) {
        $drive = "$(Split-Path -path $pwd -Leaf)"
    }
    $prompt += Write-Prompt -Object $drive -ForegroundColor $sl.Colors.DriveForegroundColor

    $status = Get-VCSStatus
    if ($status) {
        $prompt += Write-Prompt -Object " git:(" -ForegroundColor $sl.Colors.PromptHighlightColor
        $prompt += Write-Prompt -Object "$($status.Branch)" -ForegroundColor $sl.Colors.WithForegroundColor
        $prompt += Write-Prompt -Object ")" -ForegroundColor $sl.Colors.PromptHighlightColor
        if ($status.Working.Length -gt 0) {
            $prompt += Write-Prompt -Object (" " + $sl.PromptSymbols.GitDirtyIndicator) -ForegroundColor $sl.Colors.GitDirtyColor
        }
        else {
            $prompt += Write-Prompt -Object (" " + $sl.PromptSymbols.GitDefaultIndicator) -ForegroundColor $sl.Colors.GitDefaultColor
        }
    }

    # Python virtual Env
    # $venv = Get-VirtualEnvName
    # if (Test-VirtualEnv) {
        # $BufferWidth = [Console]::BufferWidth
        # $lineLength = ($line -replace "\u001B.*?{L}").Length
        # 
        # $Align = $BufferWidth - $lineLength - $prompt.Length
        # $venvAligned = "{0, $Align}" -f $venv
# 
        # $prompt += Write-Prompt -Object "$venvAligned" `
            # -ForegroundColor $sl.Colors.VirtualEnvForegroundColor
    # }
    

    $prompt += "`r`n"
    $prompt += "> "
    $prompt
}

$sl = $global:ThemeSettings #local settings
$sl.PromptSymbols.PromptIndicator = [char]::ConvertFromUtf32(0x221a)
$sl.Colors.PromptSymbolColor = [ConsoleColor]::Magenta
$sl.Colors.PromptHighlightColor = [ConsoleColor]::Blue
$sl.Colors.DriveForegroundColor = [ConsoleColor]::DarkMagenta
$sl.Colors.WithForegroundColor = [ConsoleColor]::Red
#$sl.PromptSymbols.GitDefaultIndicator = [char]::ConvertFromUtf32(0x221a)
$sl.PromptSymbols.GitDefaultIndicator = ""
$sl.PromptSymbols.GitDirtyIndicator = '署'
$sl.Colors.GitDefaultColor = [ConsoleColor]::DarkGreen
$sl.Colors.GitDirtyColor = [ConsoleColor]::DarkRed
$sl.Colors.VirtualEnvForegroundColor = [ConsoleColor]::Green