# needs admin for WMI root... for this to work
$thermalZones = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"

foreach ($zone in $thermalZones) {
    $celsius = ($zone.CurrentTemperature / 10) - 273.15 # original is K*10 to avoid dealing with floating point. we need to reverse that and convert to C
    $fahrenheit = ($celsius * 9/5) + 32 # convert C to F for americans
    Write-Host "Sensor: $($zone.InstanceName), Celsius: $($celsius.ToString('0.00'))°C, Fahrenheit: $($fahrenheit.ToString('0.00'))°F"
}