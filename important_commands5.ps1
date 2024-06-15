# Create a directory
New-Item -Path 'C:\' -ItemType 'Directory' -Name 'mydir'

# Create files
New-Item -Path 'C:\mydir' -ItemType 'File' -Name '1.txt'

New-Item -Path 'C:\mydir' -ItemType 'File' -Name '2.txt'

New-Item -Path 'C:\mydir' -ItemType 'File' -Name '1.jpg'

New-Item -Path 'C:\mydir' -ItemType 'File' -Name '2.jpg'

# Remove file from a directory
Get-ChildItem -Path 'C:\mydir' -Recurse | Remove-Item

# Sort file based on their extension and remove from a directory
Get-ChildItem -Path 'C:\mydir' -Include '*.txt' -Recurse | Remove-Item

New-Item -Path 'C:\' -ItemType 'Directory' -Name 'Moved'

# Move item from one directory to another
Get-ChildItem -Path 'C:\mydir' -Include '*.txt' -Recurse | Move-Item -Destination 'C:\Moved'

# Create local users
New-LocalUser -Name 'User1' -Description 'sales' -NoPassword

New-LocalUser -Name 'User2' -Description 'sales' -NoPassword 

New-LocalUser -Name 'User3' -Description 'support' -NoPassword 

New-LocalUser -Name 'User4' -Description 'support' -NoPassword    

# Get local user based on their description, disable the users and set their description to disabled
Get-LocalUser | Where-Object { $_.Description -eq 'sales'} | ForEach-Object { 
    Disable-LocalUser -Name $_.Name 
    Set-LocalUser -Name $_.Name -Description 'disabled'
}

# Get running processes with handles less than 100
Get-Process | Where-Object { $_.Handles -lt 100 }
