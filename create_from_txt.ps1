# Load content of a txt file and store it in $Users variable
$Users = Get-Content -Path C:\scripts\users.txt

# Hard code the password
$Password = ConvertTo-SecureString -String 'Pa$$w0rd' -AsPlainText -Force

foreach ($user in $Users) 
{
    # Create users based on content of the file
    New-LocalUser -Password $Password -Name $user -Description ($user + "'s new account")
}