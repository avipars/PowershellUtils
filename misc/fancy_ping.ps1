$ip = "127.0.0.1" #ip to ping

Test-Connection $ip -Count ([int32]::MaxValue)