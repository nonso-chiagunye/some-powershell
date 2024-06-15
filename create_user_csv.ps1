$UserToCreate = Import-Csv -Path C:\scripts\usernames.csv 

foreach ($Item in $UserToCreate) 
{
    $Password = ConvertTo-SecureString -String $Item.PASSWORD -AsPlainText -Force 
    New-LocalUser -Name $Item.LOGINNAME -Password $Password -Description $Item.DESCRIPTION
}