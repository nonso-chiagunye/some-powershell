$NewUsers = Import-Csv -Path C:\scripts\user_csv.csv

foreach ($user in $NewUsers)
{
    New-ADOrganizationalUnit -Name $user.Department -Path 'DC=Root,DC=Local'

    $Password = ConvertTo-SecureString -String $user.UserPassword -AsPlainText -Force

    $OU = "OU=$($user.Department),DC=root,DC=local"

    New-ADUser -Name $user.Name -AccountPassword $Password -Enabled $true -Path $OU -UserPrincipalName $user.UPN 
}