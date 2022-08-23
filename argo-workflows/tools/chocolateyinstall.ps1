$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/argoproj/argo-workflows/releases/download/v3.3.9/argo-windows-amd64.exe.gz'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64bit      = $url64
  softwareName  = 'argo-workflows'
  checksumType  = 'sha256'
  checksum64    = 'ea21e993e6df60f9494b793a733505c3d0141bff2f957729ca1f75a610fbeded'
  checksumType64= 'sha256'
  silentArgs   = ''
  validExitCodes= @(0)
}
Install-ChocolateyZipPackage $packageName $url $toolsDir $url64 -checksum64 $checksum64 -checksumType64 $checksumType64
Rename-Item $toolsDir/argo-windows-amd64.exe $toolsDir/$packageName.exe
