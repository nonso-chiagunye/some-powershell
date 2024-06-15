$NewUsers = Get-Content -Path C:\scripts\users2.txt

$Password = ConvertTo-SecureString  -String 'Pa$$w0rd' -AsPlainText -Force

# Create in the Dev OU
$OU = 'OU=Dev,DC=root,DC=local'

foreach ($user in $NewUsers)
{
    New-ADUser -Name $user -AccountPassword $Password -Enabled $true -Path $OU 
}