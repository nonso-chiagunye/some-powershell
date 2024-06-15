# Get all Services
Get-Service

# Get only spooler service
Get-Service | Where-Object { $_.Name -eq 'Spooler' }

# Get detailed properties and methods in Service class
Get-Service | Get-Member

# Create user Sandra
New-LocalUser -Name 'Sandra' -Description "Sandra's Account" -NoPassword

# Create user Bobby
New-LocalUser -Name 'Bobby' -Description "Bobby Account" -NoPassword

# Get enabled users
Get-LocalUser | Where-Object { $_.Enabled -eq $True }

# Get enabled users and export to txt file
Get-LocalUser | Where-Object { $_.Enabled -eq $True } | Out-File -FilePath $PWD\source\enabled_users.txt  

# Get enabled users and export to CSV
Get-LocalUser | Where-Object { $_.Enabled -eq $True } | Export-Csv -Path $PWD\source\enabled_users.csv -NoTypeInformation

# Get enabled users with only few properties
Get-LocalUser | Where-Object { $_.Enabled -eq $True } | Select-Object -Property Name,Enabled,Description | Export-Csv -Path $PWD\source\enabled_users_props.csv -NoTypeInformation
