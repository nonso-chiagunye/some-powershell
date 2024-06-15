# Create new directory
New-Item -Path 'C:\MyDir' -ItemType Directory

# Create new file in a directory
New-Item -Path 'C:\MyDir\1.txt' -ItemType File 
New-Item -Path 'C:\MyDir\2.txt' -ItemType File

# Remove all file in a directory
Get-ChildItem -Path 'C:\MyDir' | Remove-Item -Force

# Remove all files with extension .txt
Get-ChildItem -Path 'C:\MyDir'| Where-Object {$PSItem.Extension -eq '.txt'} | Remove-Item -Force

# Move (cut) all .bmp files from one directory to another
Get-ChildItem -Path 'C:\MyDir'| Where-Object {$PSItem.Extension -eq '.bmp'} | Move-Item -Destination 'C:\moved'

# Create new users
New-LocalUser -Name 'user1' -Description 'sales' -NoPassword
New-LocalUser -Name 'user2' -Description 'sales' -NoPassword
New-LocalUser -Name 'user3' -Description 'support' -NoPassword
New-LocalUser -Name 'user4' -Description 'support' -NoPassword

# Change description of local users
Get-LocalUser | Where-Object {$PSItem.Description -eq 'sales'} | Disable-LocalUser

Get-LocalUser | Where-Object {$PSItem.Description -eq 'sales'} | Set-LocalUser -Description 'disabled'

# Get all processes with Handle Count less than 100 
Get-Process | Where-Object {$PSItem.HandleCount -lt 100} 