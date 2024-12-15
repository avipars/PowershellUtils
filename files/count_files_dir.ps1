# count number of files of specific type in a directory (even if there is a lot of nesting)
# use this before running extract_files_dir.ps1
# Define source and destination folders (both need to exist for this to work)
$srcFolder = "C:\Users\Blah\Downloads\Folder\"

if (-Not (Test-Path -Path $srcFolder)){
    Write-Host "$srcFolder doesn't exist"
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