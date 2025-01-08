# Define function to compare file hashes
function Compare-FileHashes($FilePath1, $FilePath2){
    if ([string]::IsNullOrWhiteSpace($FilePath1) -or [string]::IsNullOrWhiteSpace($FilePath2)) {
        Write-Output "File paths cannot be empty."
        return
    }

    $hash1 = Get-FileHash $FilePath1
    $hash2 = Get-FileHash $FilePath2

    if ($hash1.Hash -eq $hash2.Hash) {
        
        Write-Output "The hashes of '$FilePath1' and '$FilePath2' match. $hash1.Hash"
        return $true
    } else {
        Write-Output "The hashes of '$FilePath1' and '$FilePath2' do not match. $hash1.Hash"
        return $false
    }
}

$dir =  "C:\Users\blah\Desktop\" #change to the relevant directory (initial directory for the dialog)

# Prompt the user to select files using a file dialog box
$FilePath1 = Read-Host "Enter the path to the first file or click 'Cancel' to select a file using the File Dialog box"
if ($FilePath1 -eq "") {
    $FilePath1 = (New-Object System.Windows.Forms.OpenFileDialog -Property @{InitialDirectory = $dir}).ShowDialog() | Out-Null
    $FilePath1 = (New-Object System.Windows.Forms.OpenFileDialog -Property @{InitialDirectory = $dir}).FileName
}

$FilePath2 = Read-Host "Enter the path to the second file or click 'Cancel' to select a file using the File Dialog box"
if ($FilePath2 -eq "") {
    $FilePath2 = (New-Object System.Windows.Forms.OpenFileDialog -Property @{InitialDirectory = $dir}).ShowDialog() | Out-Null
    $FilePath2 = (New-Object System.Windows.Forms.OpenFileDialog -Property @{InitialDirectory = $dir}).FileName
}


# Compare file hashes
if(Compare-FileHashes $FilePath1 $FilePath2){
       $FileToDelete = Read-Host "The files match. Enter 1 to delete the first file, 2 to delete the second file, or any other value to not delete any"
    if ($FileToDelete -eq "1") {
        Remove-Item $FilePath1
    }
    elseif ($FileToDelete -eq "2") {
        Remove-Item $FilePath2
    }
}