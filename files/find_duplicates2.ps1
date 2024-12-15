$srcDir = "C:\Users\blah\Downloads"

# Get all files in the source directory and its subdirectories
$files = Get-ChildItem -Path $srcDir -File -Recurse

# Group files by their size
foreach ($group in $files | Group-Object -Property Length | Where-Object { $_.Count -gt 1 }) {
    $size = $group.Name
    
    # Get file hashes for files with the same size
    $hashes = $group.Group | Get-FileHash | Group-Object -Property Hash | Where-Object { $_.Count -gt 1 }
    
    # Notify user about duplicate files with the same size and hash
    foreach ($hash in $hashes) {
        Write-Host "Duplicate files with size $($size) and hash $($hash.Name.Substring(0,6)):"
        foreach ($file in $hash.Group) {
           $p = $file.Path
            Write-Host "$p"
         
            #Invoke-Item -path $file.Path
                 
            # Add your own logic here
        }
    }
}