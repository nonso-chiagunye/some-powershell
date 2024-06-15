$service = Get-Service -Name 'spooler' 

# Display name is 'print spooler'. Use array method to select the first part
$FirstPart = $service.DisplayName.Split(' ')[0] 

$FirstPart 