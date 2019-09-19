$Env:PATH = [Runtime.InteropServices.RuntimeEnvironment]::GetRuntimeDirectory()
[AppDomain]::CurrentDomain.GetAssemblies() | % {
  $pt = $_.Location
  if (! $pt) {continue}
  if ($cn++) {''}
  $na = Split-Path -Leaf $pt
  Write-Host -ForegroundColor Yellow "NGENing $na"
  ngen install $pt
}