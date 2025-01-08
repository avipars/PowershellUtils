# opens all files (of certain type) in a directory (not recursive - ie no nested files will open)
# this may slow down your computer and open many tabs! 
$path =  "C:\Users\blah\Desktop\"
$only_open = "*.svg", "*.jpg","*.jpeg", "*.png", ".docx", ".doc", ".txt",".pdf" ; #If empty will search in all file formats
Invoke-Item $path #open the main folder

Set-Location -Path $path #set the base location to main folder

$count = 0 
foreach($file in Get-ChildItem $path -Include $only_open -File)
{
    Invoke-Item -path $file #open with default program
    $count++
} 

Write-Host "Opened $count files total"