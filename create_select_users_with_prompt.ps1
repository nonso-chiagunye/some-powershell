# Import content of csv file
$AllUsers = Import-Csv -Path C:\scripts\user-lab.csv 

foreach ($user in $AllUsers) 
{
    if ($user.DEPARTMENT -eq 'EvilWizards')
    {
        # If user department is EvilWizards, check if user want to create
        Write-Host -NoNewline 'Do you want to create user with department EvilWizards? Y/N '
        $Answer = Read-Host

        if ($Answer -eq 'Y')
        {
            # If yes, then create user
            $Password = ConvertTo-SecureString -String $user.PASSWORD -AsPlainText -Force 
            New-LocalUser -Name $user.LOGINNAME -Password $Password -Description $user.DEPARTMENT  
        }
        else 
        {
            # If answer is N, only print message
            ‘This user cannot be imported because the Department is ' + $user.DEPARTMENT + '!!'
        }        
    }
    else
    {    
    # If user department is not EvilWizards, create user without further prompt
    $Password = ConvertTo-SecureString -String $user.PASSWORD -AsPlainText -Force 
    New-LocalUser -Name $user.LOGINNAME -Password $Password -Description $user.DEPARTMENT    
    }
}