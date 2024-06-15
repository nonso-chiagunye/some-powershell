# Get all services. Print different message for spooler than other services
$services = Get-Service

foreach($service in $services)
{
    if ($service.Name -eq 'spooler')
    {
        '.................'
        'Wow, I found the '+ $service.Name + ' service! Really cool!'
        '...................'
    }
    else
    {
     'The '+$service.Name + ' is a great service!'
    }   
}