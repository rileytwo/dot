#
# est.ps1
# Engagement Scoring Template
#


param(
    [string]$type = "Initial Scoring",
    [string]$out = "",
    [string]$source = "S:\Engagement Scoring\"
)

function get_template() {
    Get-ChildItem "$($source)$($type) Template"
}

function mk_dir() {
    foreach ($i in $input) {
        Copy-Item $i -Destination $out
    }
}

Write-Output "Copying template from $($source)$($type) into $($out)"

get_template | mk_dir
