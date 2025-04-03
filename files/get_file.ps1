# Add this to a script for a nice file selection box 

Function Get-FileName($initialDirectory)
{   
 [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") |
 Out-Null

 $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
 $OpenFileDialog.initialDirectory = $initialDirectory
 $OpenFileDialog.filter = "Excel Files (*.xlsx)| *.xlsx|csv files (*.csv)|*.csv|txt files (*.txt)|*.txt|All files (*.*)|*.*"
 $OpenFileDialog.ShowDialog() | Out-Null
 $OpenFileDialog.filename
} #end function Get-FileName

# *** Entry Point to Script ***

$file = Get-FileName -initialDirectory "c:fso"
Write-Host $file