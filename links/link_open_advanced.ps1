# open a list of links in chrome 
# this may slow down your computer and open many tabs! 

$links = Get-Content "C:\links.txt"  # each URL should be in it's own line

$links = $links.Trim() # remove any spaces at end, start
$i = 0

foreach ($item in $links) {
    Write-Host $item $i
    start chrome $item
    $i++
    Start-Sleep -Seconds 5
}

Write-Host $i " link(s) opened"