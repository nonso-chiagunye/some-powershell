# Get name input
Write-Host -NoNewline 'What is the UserName? '
$UserName = Read-Host

# Retrieve the user object
$UserObject = Get-LocalUser -Name $UserName 
# Check if user is enabled, and enable or disable according to the result
if ($UserObject.Enabled -eq $true) 
{
    Disable-LocalUser $UserObject.Name
} 
else 
{
    Enable-LocalUser $UserObject.Name
}