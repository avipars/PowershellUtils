# please exercise caution before running 

# a BT driver for an intel adapter kept on crashing, so I made a script to help, be careful as this may ruin some functionality in your computer (checked on Windows 10)

# most likely, this requires elevation at some stage (to admin) to run the troubleshooter 
$bt = Get-TroubleshootingPack -Path "C:\Windows\diagnostics\system\Bluetooth" 
 Invoke-TroubleshootingPack -Pack $bt -Result "C:\DiagResult"