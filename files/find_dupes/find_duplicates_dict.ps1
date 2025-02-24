# hash dictionary way to find dupes
# Specify the folder containing the _ files
$folderPath = "C:\Users\blah\Downloads"

# Get all _ files in the folder (you can modify the filter as needed) to include relevant file types
$ourFiles = Get-ChildItem -Path $folderPath -File -Include *.pdf,*.docx,*.txt

# Dictionary to store hash values and file paths
$hashDictionary = @{}

# Iterate through each _ file and calculate its hash
foreach ($file in $ourFiles) {
    $hash = Get-FileHash -Path $file.FullName -Algorithm SHA256 | Select-Object -ExpandProperty Hash

    # Check if the hash already exists in the dictionary (indicating a duplicate)
    if ($hashDictionary.ContainsKey($hash)) {
        $hashDictionary[$hash] += @($file.FullName)
    } else {
        $hashDictionary[$hash] = @($file.FullName)
    }
}

# Display duplicates based on the hash
foreach ($hash in $hashDictionary.Keys) {
    $files = $hashDictionary[$hash]
    if ($files.Count -gt 1) {
        Write-Host "Duplicate files (Hash: $hash):"
        $files | ForEach-Object { Write-Host "  $_" }
    }
}