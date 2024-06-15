$dirs = Get-Content -Path C:\scripts\users.txt 

foreach ($dir in $dirs) 
{
    New-Item -Path C:\scripts -ItemType 'Directory' -Name ($dir+'-directory')
}