# $RandomNumber = 1, 2 | Get-Random
$RandomNumber = Get-Random -Minimum 1 -Maximum 3

Write-Host -NoNewline 'Please guess the number 1 or 2 and I will tell you if you were right ! '
[int]$UserGuess = Read-Host

if ($UserGuess -eq $RandomNumber)
{
    'Yes you guessed it ! It was ' + $RandomNumber
}
else
{
    'Sorry, you lose ! It was ' + $RandomNumber + ' And you guessed ' + $UserGuess
}