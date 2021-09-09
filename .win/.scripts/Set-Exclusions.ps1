
#$CurrentExclusionPaths = $(
#	Get-MpPreference | ForEach-Object { $_.ExclusionPath }
#)

$Exclusions = @()

$Logitech = @(
	"$env:ProgramFiles\Logitech\LogiOptions\LogiOptions.exe",
	"$env:ProgramData\Logishrd\LogiOptions\Software\Current\LogiOptionsMgr.exe",
	"$env:ProgramData\Logishrd\LogiOptions\Software\Current\LogiOverlay.exe",
	"$env:ProgramData\Logishrd\LogiOptions\Software\Current\LogiOptionsUI.exe"
)

$RStudio = @(
	"$env:ProgramFiles\RStudio\bin\consoleio.exe",
	"$env:ProgramFiles\RStudio\bin\crashpad_handler.exe",
	"$env:ProgramFiles\RStudio\bin\crashpad_http_upload.exe",
	"$env:ProgramFiles\RStudio\bin\diagnostics.exe",
	"$env:ProgramFiles\RStudio\bin\QtWebEngineProcess.exe",
	"$env:ProgramFiles\RStudio\bin\rpostback.exe",
	"$env:ProgramFiles\RStudio\bin\rsession.exe",
	"$env:ProgramFiles\RStudio\bin\rsinverse.exe",
	"$env:ProgramFiles\RStudio\bin\rstudio.exe",
	"$env:ProgramFiles\RStudio\bin\urlopener.exe",
	"$env:ProgramFiles\RStudio\bin\winpty-agent.exe"
)

$R = @(
	"$env:ProgramFiles\R\R-*\bin\R.exe",
	"$env:ProgramFiles\R\R-*\bin\Rscript.exe",
	"$env:ProgramFiles\R\R-*\bin\config.sh",
	"$env:ProgramFiles\R\R-*\bin\x64\open.exe",
	"$env:ProgramFiles\R\R-*\bin\x64\R*.exe"
)

$Rtools = @(
	"$env:RTOOLS40_HOME\msys2.exe",
	"$env:RTOOLS40_HOME\mingw64.exe",
	"$env:RTOOLS40_HOME\mingw32.exe",
	"$env:RTOOLS40_HOME\mingw64\x86_64-w64-mingw32\bin\*.exe"
)

$VSCodeUser = @(
	"$env:USERPROFILE\AppData\Local\Programs\Microsoft VS Code\Code.exe",
	"$env:USERPROFILE\AppData\Local\Programs\Microsoft VS Code\bin\code",
	"$env:USERPROFILE\AppData\Local\Programs\Microsoft VS Code\bin\code.cmd",
	"$env:USERPROFILE\AppData\Local\Programs\Microsoft VS Code\resources\app\out\vs\platform\files\node\watcher\win32\CodeHelper.exe"
)

$VSCodeGlobal = @(
	"$env:ProgramFiles\Microsoft VS Code\Code.exe",
	"$env:ProgramFiles\Microsoft VS Code\bin\code",
	"$env:ProgramFiles\Microsoft VS Code\bin\code.cmd",
	"$env:ProgramFiles\Microsoft VS Code\resources\app\out\vs\platform\files\node\watcher\win32\CodeHelper.exe"
)

$Office = @(
	"$env:USERPROFILE\AppData\Local\Microsoft\Teams\current\Teams.exe",
	"$env:ProgramFiles\Microsoft Office\root\Office16\OUTLOOK.EXE",
	"$env:ProgramFiles\Microsoft Office\root\Office16\EXCEL.EXE",
	"$env:ProgramFiles\Microsoft Office\root\Office16\MSACCESS.EXE",
	"$env:ProgramFiles\Microsoft Office\root\Office16\ONENOTE.EXE",
	"$env:ProgramFiles\Microsoft Office\root\Office16\ONENOTEM.EXE"
)

$Misc = @(
	"$env:USERPROFILE\.local\bin\radian.exe"
)

$Scoop = (
	"$env:USERPROFILE\scoop\apps\7zip\current\7z*.exe",
	"$env:USERPROFILE\scoop\apps\bat\current\bat.exe",
	"$env:USERPROFILE\scoop\apps\fzf\current\fzf.exe",
	"$env:USERPROFILE\scoop\apps\git\current\git*.exe",
	"$env:USERPROFILE\scoop\apps\keypirinha\current\keypirinha.exe",
	"$env:USERPROFILE\scoop\apps\miniconda3\current\_conda.exe",
	"$env:USERPROFILE\scoop\apps\miniconda3\current\pytho*.exe",
	"$env:USERPROFILE\scoop\apps\nodejs\current\node.exe",
	"$env:USERPROFILE\scoop\apps\pwsh\current\pwsh.exe",
	"$env:USERPROFILE\scoop\apps\scoop\current\bin\scoop.ps1",
	"$env:USERPROFILE\scoop\apps\scoop\current\bin\install.ps1",
	"$env:USERPROFILE\scoop\apps\scoop\current\bin\uninstall.ps1",
	"$env:USERPROFILE\scoop\apps\pwsh\current\pwsh.exe",
	"$env:USERPROFILE\scoop\apps\ripgrep\current\rg.exe"
)

$Exclusions += @(
	$Logitech,
	$RStudio,
	$R,
	$Rtools,
	$Scoop,
	$Office,
	$VSCodeUser,
	$VSCodeGlobal,
	$Misc
)

function Set-Exclusions([array] $exclusions) {
	$resolvedPaths = @()
	$invalidPaths = @()


	foreach ($exclusionGroup in $exclusions) {
		try {
			foreach ($exclusion in $exclusionGroup) {
				$resolvedPaths += Resolve-Path($exclusion) -ErrorAction Stop
			}
		}
		catch [System.Management.Automation.ItemNotFoundException] {
			Write-Warning "$exclusion does not exist"
			$invalidPaths += $exclusion
		}
	}
	foreach ($resolvedPath in $resolvedPaths) {
		try {
			Add-MpPreference -ExclusionPath $resolvedPath -ErrorAction Continue
		}
		catch [System.UnauthorizedAccessException] {
			Write-Warning "Woah there! You don't have the permissions to exclude $resolvedPath"
		}
	}
}


Set-Exclusions $Exclusions