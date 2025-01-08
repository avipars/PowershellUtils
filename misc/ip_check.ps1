$uri = "https://whatismyip.host/ip4"

$ipv4 = (Invoke-WebRequest -uri $uri).Content

$currentip = "127.0.0.1"
$val = $true
$exists = $false

$powershell = "iplist.txt"
Invoke-Item $powershell
$file = Get-Content $powershell

:loop1 while ($val){
    $containsWord = $file | %{$_ -match $ipv4}
    if ($containsWord -contains $true) {
        Write-Output "same IP - $ipv4"
        $val = $true
        Start-Sleep -Seconds 2000 #sleep for 25 minutes
        $exists = $true
        $val = $true
    } else {
        Write-Output "not equal - $ipv4 vs $currentip"
        Set-Clipboard -Value $ipv4
        $exists = $false
        Add-Content $powershell "$ipv4"
        [console]::beep(500,300)
        $Response = Invoke-WebRequest -Uri "http://your_url_here" #get request
        Write-Output $Response.StatusCode #check results
        break loop1
    }
}


#old http://ifconfig.me/ip

<#
:loop while ($val) {
if($ipv4 -ne $currentip){
Write-Output "not equal - $ipv4 vs $currentip"
Set-Clipboard -Value $ipv4

    $val = $false
    [console]::beep(500,300)
    break loop
    $currentip = $ipv4
}
else{
    Write-Output "same IP - $ipv4"
    $val = $true
    Start-Sleep -Seconds 500
}
}

#Invoke-RestMethod -Uri ('http://ipinfo.io/'+(Invoke-WebRequest -uri "http://ifconfig.me/ip").Content

#>