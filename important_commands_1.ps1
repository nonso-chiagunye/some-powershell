
Get-Service -Name 'Spooler' | Start-Service

Get-Service -Name 'Spooler' | Stop-Service

Get-Disk

Get-Volume

Get-Volume -DriveLetter 'C'

# Add a local user without a password
New-LocalUser -Name 'Freddy'-NoPassword

#Extra Stuff

Get-LocalUser #To find users

#If we wanted to give Freddy a new description
# Update property of a local user
Set-LocalUser -Name 'Freddy' -Description 'Freddies Basement' #Without pipeline 
# Update property of a local user with pipeline
Get-LocalUser -Name 'Freddy' | Set-LocalUser -Description 'Freddies coming for you' #With pipeline notice, that we don't use the -Name parameter
#with Set-LocalUser because of the pipeline PowerShell already knows which user needs to be set !