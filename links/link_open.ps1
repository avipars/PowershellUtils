# open a list of links in chrome
# this may slow down your computer and open many tabs! 

$links = Get-Content "C:\links.txt"  # each URL should be in it's own line, 

foreach ($item in $links) {
    start chrome $item
}