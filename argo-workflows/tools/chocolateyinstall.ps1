$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/argoproj/argo-workflows/releases/download/v3.4.2/argo-windows-amd64.exe.gz'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url64bit      = $url64
  softwareName  = 'argo-workflows'
  checksum64    = 'df128ddbb4b1323c4ffd40e5647f322cd9986157c0dafb2652159133b6dd9442'
  checksumType64= 'sha256'
}
Install-ChocolateyZipPackage $packageName $url $toolsDir $url64 -checksum64 $checksum64 -checksumType64 $checksumType64
Move-Item -Force $toolsDir/argo-windows-amd64.exe $toolsDir/$packageName.exe
