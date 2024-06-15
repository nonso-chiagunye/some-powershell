# Let the user input service name
Write-Host -NoNewline 'Enter the service you want to check: '
$ServiceName = Read-Host 

# Get service object of inputed service
$ServiceObject = Get-Service -Name $ServiceName

while ($ServiceObject.Status -eq 'Running')
{
    # Keep printing till service status changes from running to stopped
    $ServiceObject.Name + ' is running!'
    ''
    Sleep -Seconds 5
    $ServiceObject = Get-Service $ServiceObject.Name
}

$ServiceObject.Name + ' has stopped!'