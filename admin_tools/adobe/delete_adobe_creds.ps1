# deletes stored adobe credentials
cmdkey /list | ForEach-Object {if ($_ -like "*Adobe*") {cmdkey /del:($_ -replace '^.+=', '')}}