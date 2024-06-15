# Get content of the txt file and store in $NewUser variable 
$NewUsers = Get-Content -Path C:\scripts\users_new.txt

$Password = ConvertTo-SecureString  -String 'Pa$$w0rd' -AsPlainText -Force

# No OU specified, so will be added to default OU
foreach ($user in $NewUsers)
{
    New-ADUser -Name $user -AccountPassword $Password -Enabled $true
}