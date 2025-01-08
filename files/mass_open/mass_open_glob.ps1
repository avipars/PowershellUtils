$path =  "C:\Users\blah\Desktop\"
$filetype = "\*.pdf"
# by default opens all PDFs in the path 

Write-Output "Opening all files matching this pattern: $path$filetype"

Invoke-Item "$path$filetype" # uses file globbinh