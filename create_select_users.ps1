# Import content of user-lab.csv file
$AllUsers = Import-Csv -Path C:\scripts\user-lab.csv 

foreach ($user in $AllUsers) 
{
    # If user.DEPARTMENT is EvilWizards, only print a message
    if ($user.DEPARTMENT -eq 'EvilWizards')
    {
        ‘This user cannot be imported because the Department is ' + $user.DEPARTMENT + '!!'
    }
    else
    {
    # If user.DEPARTMENT is not EvilWizards, create the user
    $Password = ConvertTo-SecureString -String $user.PASSWORD -AsPlainText -Force 
    New-LocalUser -Name $user.LOGINNAME -Password $Password -Description $user.DEPARTMENT
    
    }
}