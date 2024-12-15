
# run 2 exe files with a given input text file and compare output
# the exe files can be (mostly) any application that accepts user input via the console 
$src_exe =  "C:\Ex1.exe"
$his_exe =  "C:\Ex2.exe"

$base = "C:\Ex1\Scripts\"
Set-Location -Path $base # location for input scripts

$curr = "input.txt"  # input scripts to exe, each new line = new entry

$inp = Join-Path -path $base -ChildPath ".\input\$curr"
$cmp = Join-Path -path $base -ChildPath ".\output\$curr"

$input_code = Get-Content -raw -path $inp
$cmp_code = Get-Content -path $cmp

$output = $input_code | & $one_exe #runs the exe and pipes the input
$output2 = $input_code | & $two_exe #runs 2nd exe "" 

$output | out-file -FilePath ".\PS\Output_1_$curr" #save the output for your use later
$output2 | out-file -FilePath ".\PS\Output_2_$curr" #save the output for your use later

Compare-Object ($output) ($cmp_code) # compare via powershell