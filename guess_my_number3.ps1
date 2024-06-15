$Guess = Get-Random -Minimum 1 -Maximum 6

Write-Host -NoNewline 'Please guess the number between 1 to 5 '
[int]$UserGuess = Read-Host

while ($UserGuess -ne $Guess)
{
    'Sorry, ' + $UserGuess + ' is not currect. Please guess again!'
    $Guess = Get-Random -Minimum 1 -Maximum 6
    [int]$UserGuess = Read-Host
}

'YESSSSSSS!!!! You guessed it. The number is ' + $Guess