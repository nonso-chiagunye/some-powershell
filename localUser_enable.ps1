$localusers = Get-LocalUser 

foreach($localuser in $localusers)
{
    if ($localuser.Enabled -eq $true)
    {
        Set-LocalUser -Name $localuser.Name -Description 'User Enabled'
    }
    else
    {
        Set-LocalUser -Name $localuser.Name -Description 'User Disabled'
    }
}