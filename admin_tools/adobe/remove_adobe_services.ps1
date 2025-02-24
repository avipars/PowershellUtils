# stops and deletes the following adobe services
$servs = "AdobeARMservice", "AGMService" , "AdobeUpdateService" ,"AGSService"
foreach($service in $servs)
{
    sc.exe stop $service 
    sc.exe delete $service
}