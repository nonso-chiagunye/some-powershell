# Make input cusor appear on same line as prompt
Write-Host -NoNewline 'Please provide the name of the service: '
$ServiceName = Read-Host # Get user input and store it in $ServiceName variable

# Get the service object and store iit in $ServiceObject variable
$ServiceObject = Get-Service -Name $ServiceName 

# Check if service has status 'running'
if ($ServiceObject.Status -eq 'Running') 
{
    'The service named ' + $ServiceObject.Name + ' has the status ' + $ServiceObject.Status
    ''
    # Check if user want to stop the service
    Write-Host -NoNewline 'Do you want to stop the service named '$ServiceObject.Name'? Y/N '
    $Answer = Read-Host
    # Stop the service if the user opts for stopping
    if ($Answer -eq 'Y')
    {
        'Stopping the service named ' + $ServiceObject.Name + '...........'
        Stop-Service $ServiceObject.Name
        ''
        $ServiceObject.Name + ' stopped!'
    }
    # Only print a message if the user does not want to stop
    elseif ($Answer -eq 'N')
    {
        $ServiceObject.Name + ' is still ' + $ServiceObject.Status
    }

}
else 
# If service is already stopped, check if user want to start it
{
    'The service named ' + $ServiceObject.Name + ' has the status ' + $ServiceObject.Status
    ''
    # Get user response (to start or not)
    Write-Host -NoNewline 'Do you want to start the service named ' $ServiceObject.Name '? Y/N '
    $Answer = Read-Host
    # Start the service if the user opts for it
    if ($Answer -eq 'Y')
    {
        'Starting the service named ' + $ServiceObject.Name + '...........'
        Start-Service $ServiceObject.Name
        ''
        $ServiceObject.Name + ' started!'
    }
      # Only print a message if the user does not opt for starting
    elseif ($Answer -eq 'N')
    {
        $ServiceObject.Name + ' is still ' + $ServiceObject.Status
    }

}