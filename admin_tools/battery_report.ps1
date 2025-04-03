# technically it's not powershell, but you can call the program from within powershell

powercfg /? # help/info regarding all available commands (some require elevation)

powercfg /batteryreport # gives breakdown of laptop battery usage and life (this one doesn't need admin)


$dir = "C:\Users\Blah\Downloads" # select a directory
powercfg /batteryreport /output "$dir\battery-health-report.html" #outputs the report here