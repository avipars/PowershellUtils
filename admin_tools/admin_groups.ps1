Add-LocalGroupMember -Group "Administrators" -Member "TheBoss" #adds a user to the local admin group
#List all the local security groups
Get-LocalGroup

#Get single group detail
Get-LocalGroup -Name "Administrators"
Get-LocalGroupMember -Group "Administrators"