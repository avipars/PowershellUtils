# gets file hash and prints (md5 and sha256)
function Get-FileHashes {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path
    )

    # Check if the file exists
    if (-not (Test-Path -Path $Path)) {
        Write-Output "Error: File at path '$Path' does not exist."
        return
    }
    try {
        $fileStream = [System.IO.File]::Open($Path, 'Open', 'Read', 'None')
        $fileStream.Close()
    } catch {
        Write-Output "Error: File at path '$Path' is being used by another process."
        return
    }

    # Calculate hash using the default algorithm (SHA256)
    $defaultHash = Get-FileHash -Path $Path
    Write-Output "Hash for $Path (default algorithm): $($defaultHash.Hash)"

    # Alternative: Calculate hash using specific algo and store in a variable
    Get-FileHash -Path $Path -Algorithm MD5 -OutVariable MD5Hash
    Write-Output "Hash for $Path using MD5: $($MD5Hash.Hash)"
}

$p1 = "C:\Users\blah\Downloads\Manual_ENG.pdf" #just for example
$p2 = "C:\Users\blah\Downloads\User_Manual.pdf"

Get-FileHashes -Path $p1 
Get-FileHashes -Path $p2 