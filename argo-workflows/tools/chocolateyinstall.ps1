$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/argoproj/argo-workflows/releases/download/v3.4.1/argo-windows-amd64.exe.gz'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url64bit      = $url64
  softwareName  = 'argo-workflows'
  checksum64    = 'b65d795fb882643229f6862a82e5e7fc3324eeda24c77d01185c6a3c3c1b7753'
  checksumType64= 'sha256'
}
Install-ChocolateyZipPackage $packageName $url $toolsDir $url64 -checksum64 $checksum64 -checksumType64 $checksumType64
Move-Item -Force $toolsDir/argo-windows-amd64.exe $toolsDir/$packageName.exe
