$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/argoproj/argo-workflows/releases/download/v3.4.0/argo-windows-amd64.exe.gz'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64bit      = $url64
  softwareName  = 'argo-workflows'
  checksum64    = 'dcdcd8c619db0a46c80c3c5f83760d9e76141ba0e7926be3d30bb5df7131a981'
  checksumType64= 'sha256'
  silentArgs   = ''
  validExitCodes= @(0)
}
Install-ChocolateyZipPackage $packageName $url $toolsDir $url64 -checksum64 $checksum64 -checksumType64 $checksumType64
Rename-Item $toolsDir/argo-windows-amd64.exe $toolsDir/$packageName.exe
