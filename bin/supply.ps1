#
# supply.ps1 for Flyway
# 
Param(
  [Parameter(Mandatory=$True,Position=1)]
    [string]$BuildDir,
  [Parameter(Mandatory=$True,Position=2)]
    [string]$CacheDir,
  [Parameter(Mandatory=$True,Position=3)]
    [string]$DepDir,
  [Parameter(Mandatory=$True,Position=4)]
    [string]$SubDir    
)

Write-Host "Supplying Flyway 5.0.7"

$url = "https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/5.0.7/flyway-commandline-5.0.7-windows-x64.zip"
$BinDir = $DepDir + "\" + $SubDir + "\bin"

New-Item -ItemType directory -Path $BinDir

# download the file
Write-Host "Downloading Flyway..."

$output = $BinDir + "\flyway.zip"
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $output)
Write-Host "Flyway has been downloaded"

Write-Host "Unzipping flyway"
Expand-Archive $output -DestinationPath $BinDir
Move-Item $BinDir\flyway-5.0.7\* $BinDir

# clean up
Write-Host "Cleaning up..."
Remove-Item -path $BinDir\flyway-5.0.7 -recurse
Remove-Item -path $BinDir\flyway.zip

Write-Host "Creating profile.bat"
$profiledFolder= $DepDir + "\" + $SubDir + "\" + ".profile.d"
$profiledFile = $profiledFolder + "\" + "profile.bat"
Write-Host "Creating $profiledFile"

New-Item -ItemType directory -Path $profiledFolder

# Create a profile.bat file to set any environment variables
Set-Content -Value "set DEPS_IDX=$SubDir" -Path $profiledFile
Add-Content -Value "set PCF_FLYWAY_BINDIR=%DEPS_DIR%/%DEPS_IDX%/bin" -Path $profiledFile
Write-Host "Flyway buildpack complete"


