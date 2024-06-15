# Import users CSV and store in NewUsers variable
$NewUsers = Import-Csv -Path C:\scripts\lab_users.csv

foreach ($user in $NewUsers)
{
    # $Department = $user.DEPARTMENT

    # Use the password column of each user to create their password
    $Password = ConvertTo-SecureString -String $user.PASSWORD -AsPlainText -Force

    # Use their deparment column to store Organization Unit
    $OU = "OU=$($user.DEPARTMENT),DC=root,DC=local"

    # Use loginname column to store User Principal Name
    $UPN = $user.LOGINNAME + '@root.local'

    # Check if the OU exists
    $OUExists = Get-ADOrganizationalUnit -Filter "Name -eq '$($user.DEPARTMENT)'"

    if (-not $OUExists)
    {

        # If the OU does not exists, create the OU first, then create the user in the newly created OU
        New-ADOrganizationalUnit -Name $user.DEPARTMENT -Path 'DC=Root,DC=Local'
        New-ADUser -Name $user.NAME -AccountPassword $Password -Enabled $true -Path $OU -UserPrincipalName $UPN -SamAccountName $user.LOGINNAME

    }
    else
    {
        # If the OU already exists, create the user in the OU
        New-ADUser -Name $user.NAME -AccountPassword $Password -Enabled $true -Path $OU -UserPrincipalName $UPN -SamAccountName $user.LOGINNAME
    }
}