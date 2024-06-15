# Import user from csv
$AllUsers = Import-Csv -Path C:\scripts\user-lab.csv 

foreach ($user in $AllUsers)
{
    # Remove user
    Remove-LocalUser -Name $user.LOGINNAME
}