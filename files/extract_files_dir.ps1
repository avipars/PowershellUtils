# extract (copy) certain files types from a directory (even if there is a lot of nesting)
# its worth running count_files_dir.ps1 before you run this script (to see the quantity)
# Define source and destination folders (both need to exist for this to work)
$srcFolder = "C:\Users\Blah\Downloads\Folder\"
$destinationFolder = "C:\Users\blah\Desktop\Extracted\"

if (-Not (Test-Path -Path $srcFolder) -or -Not (Test-Path -Path $destinationFolder)){
    Write-Host "$srcFolder or $destinationFolder doesn't exist"
    exit
}

$filter_type = "*.txt" # you can play around with the filter based on your needs
$files = Get-ChildItem -Filter $filter_type -Path $srcFolder -Recurse -File  # Get all specified files of format in the source folder and its subfolders

# if you want to work with several different formats, use the following 2 lines instead 
#$filter_type = "*.svg", "*.jpg", "*.png", ".docx", ".doc" ; #If empty will search in all file formats
#$files = Get-ChildItem -Include $filter_type -Path $srcFolder -Recurse -File

if ($files.Count -eq 0) { # Check if any files were found
    Write-Host "No $filter_type files found in the source folder."
    exit
}


Write-Host "Total $filter_type files found: $($files.Count)"

foreach ($file in $files) {
    $destinationFile = Join-Path -Path $destinationFolder -ChildPath $file.Name     # Create the destination file path

    $counter = 1     # Resolve name conflicts by appending a counter if necessary
    while (Test-Path -Path $destinationFile) {
        $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
        $extension = $file.Extension
        $destinationFile = Join-Path -Path $destinationFolder -ChildPath "$baseName_$counter$extension"
        $counter++
    }
    
    Copy-Item -Path $file.FullName -Destination $destinationFile     # Copy the file
    $processedCount++
    Write-Host "Copied ($processedCount/$($files.Count)): $($file.FullName) -> $destinationFile"
}