# Get username
Write-Host -NoNewline 'What is the UserName? '
$UserName = Read-Host

# Get user object and store in UserObject Variable
$UserObject = Get-LocalUser -Name $UserName 

# Check if user is enabled
if ($UserObject.Enabled -eq $true) 
{
    $UserObject.Name + ' is enabled'
    ''

    # If username is enable, ask if user want to disable
    Write-Host -NoNewline 'Do you want to disable '     $UserObject.Name '? y/n '
    $Answer = Read-Host 
    if ($Answer -eq 'y')
    {
      # If anser is yes, disable user and print a message
        Disable-LocalUser $UserObject.Name
        $UserObject.Name + ' is disabled'
    }
    elseif ($Answer -eq 'n')
    {
      # if answer is no, only print a message
        $UserObject.Name + ' is still enabled'
    }    
} 
else 
{
  # If user is originally disabled, as if you want to enable
    $UserObject.Name + ' is disabled'
    ''
    Write-Host -NoNewline 'Do you want to enable ' $UserObject.Name '? y/n '
    $Answer = Read-Host
    if ($Answer -eq 'y')
    {
        # Enable user if he opts for
        Enable-LocalUser $UserObject.Name
        $UserObject.Name + ' is enabled'
    }
    elseif ($Answer -eq 'n')
    {
      # Or only print a message if anser is no
        $UserObject.Name + ' is still disabled'
    }    
}