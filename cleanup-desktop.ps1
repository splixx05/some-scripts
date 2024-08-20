# Setup destination
$destinationFolder = "C:\Users\patrick.fernandez\Documents\to-do"

# Calls PATH of desktop
$desktop = [Environment]::GetFolderPath("Desktop")

# Checkup, if path of destination exists & create one, if not
if (-not (Test-Path -Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder
}

# Calls all files on desktop, except .ln & .url
$files = Get-ChildItem -Path $desktop -File | Where-Object { $_.Extension -ne ".lnk" -and $_.Extension -ne ".url" }

# Move files to destination
foreach ($file in $files) {
    $destinationPath = Join-Path -Path $destinationFolder -ChildPath $file.Name
    Move-Item -Path $file.FullName -Destination $destinationPath
}

Write-Output "All files have been moved"
