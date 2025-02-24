# needs admin for WMI root... for this to work
$temperatures = wmic /namespace:\\root\wmi PATH MSAcpi_ThermalZoneTemperature get CurrentTemperature
foreach ($temp in $temperatures) {
    $temp #prints in k*10 scale
 }
