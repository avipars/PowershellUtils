# iterate over the CSV and do some action
$path = "input.csv"
Import-Csv $path | Foreach-Object { 
    
    foreach ($property in $_.PSObject.Properties)
    {   
        Write-Output $property.Value $property.Name
        # you can provide some logic here
      
    } 

}
