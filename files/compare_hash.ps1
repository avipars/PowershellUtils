$p1 = "C:\Users\blah\Downloads\Win11_Manual_ENG.pdf"
$p2 = "C:\Users\blah\Downloads\\User_Manual(Windows_11).pdf"

Get-FileHash $p1
Get-FileHash $p2
#sha 256 by default

#change p1, p2 to any two files