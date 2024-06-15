# Change description of all the enabled accounts
Get-LocalUser | Where-Object { $_.Enabled -eq $True } | Set-LocalUser -Description 'Enabled Account'

# Select accounts with description 'Enabled Account'
Get-LocalUser | Where-Object { $_.Description -eq 'Enabled Account'}

# Output the above to txt file
Get-LocalUser | Where-Object { $_.Description -eq 'Enabled Account'} | Out-File -FilePath $PWD\source\enabled_accounts.txt 
