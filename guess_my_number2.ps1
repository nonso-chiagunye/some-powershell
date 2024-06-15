$Guess = Get-Random -Minimum 1 -Maximum 11 

Write-Host -NoNewline 'Please guess the number between 1 and 10 '
$UserGuess = Read-Host

while ($UserGuess -ne $Guess)
{
    if ($UserGuess -gt $Guess)
    {
        'Guess again, your number ' + $UserGuess + ' is too high'
    }
    else
    {
        'Guess again, your number ' + $UserGuess + ' is too low'
    }

    $UserGuess = Read-Host
}

'YESSSS YOU GUESSED IT, THE NUMBER IS ' + $Guess