# Script I use to pack chrome extensions 

# Define possible root directories (good if you use different computers or drives)
$primaryDir = "D:\code\ext"
$fallbackDir = "C:\Users\blah\Desktop\code\ext"

# Try to set the working directory
try {
    if (Test-Path $primaryDir) {
        $extensionDir = $primaryDir
    } elseif (Test-Path $fallbackDir) {
        $extensionDir = $fallbackDir
    } else {
        throw "Neither primary nor fallback directory exists"
    }

    # Set working directory
    Set-Location -Path $extensionDir

    # Create release directory if it doesn't exist
    $releaseDir = Join-Path $extensionDir "release"
    if (-not (Test-Path $releaseDir)) {
        New-Item -ItemType Directory -Path $releaseDir
    }

    # Define zip file path based on the selected directory
    $zipFilePath = Join-Path $releaseDir "extension.zip"

    Write-Host "Using directory: $extensionDir"
    Write-Host "Zip will be created at: $zipFilePath"

    # Define directories and files to exclude
    $excludeList = @("marketing", ".git", ".vscode", "release", "*.py", "*.map", "*.md", "*.ps1", "*.zip", "*.gitignore",".github")

    # Get all files and directories, excluding ones in exclude list
    $filesToZip = Get-ChildItem -Path .  | Where-Object {
        $exclude = $false
        foreach ($excludeItem in $excludeList) {
            if ($_.FullName -like "*\$excludeItem*" -or $_.Name -like $excludeItem) {
                $exclude = $true
                break
            }
        }
        -not $exclude
    }

    Compress-Archive -Path $filesToZip.FullName -DestinationPath $zipFilePath -Force     # Create a new zip file

    Write-Host "Chrome extension packed successfully: $zipFilePath"

} catch {
    Write-Error "Error: $_"
    exit 1
}

