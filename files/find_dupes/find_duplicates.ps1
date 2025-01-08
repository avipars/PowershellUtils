# 4 liner to find duplicate files based on hash and print results
$srcDir = "C:\Users\blah\Downloads\"
Get-ChildItem -Path $srcDir -File -Recurse | Group -Property Length `
    | where { $_.Count -gt 1 } | select -ExpandProperty Group | Get-FileHash `
    | Group -Property Hash | where { $_.count -gt 1 }| foreach { $_.Group | select Path, Hash } 