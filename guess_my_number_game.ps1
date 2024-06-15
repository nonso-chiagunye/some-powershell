# Generate a random number between 1 to 6 (6 not inclusive)
$Guess = Get-Random -Minimum 1 -Maximum 6

# Initialize maximum number of tries
$Repeats = 3

# Let the user guess a number
Write-Host -NoNewline 'Please guess a number between 1 and 5. You have 3 tries! '
[int]$UserGuess = Read-Host 

# Start counting down the number of tries
$Repeats = $Repeats - 1

# Keep running this code block, as long as user's guess is not correct, and number of tries is > 0
while ($UserGuess -ne $Guess -and $Repeats -gt 0) 
{
   # $Accumulator = $Accumulator + 1
   # $tries = 3 - $Accumulator

   # If user's guess is greater than the guess (random number), print this
    if ($UserGuess -gt $Guess)
    {
       Write-Host -NoNewline 'Guess again, your number '  $UserGuess  ' is too high. You have '  $Repeats  ' tries remaining '
    }
    else
    # If user's guess is less than the guess (random number), print this
    {
       Write-Host -NoNewline 'Guess again, your number '  $UserGuess  ' is too low. You have '  $Repeats  ' tries remaining '
    }
    # Prompt user to keep guessing, as long as he's not correct, while reducing number of tries remaining
    [int]$UserGuess = Read-Host 
    $Repeats = $Repeats - 1
}

# Code will only get here if either user's guess is correct, or number of tries has finished

# If user's guess is correct, run this
if ($UserGuess -eq $Guess)
{
    ''
    'YESSSSS YOU GUESSED IT, THE NUMBER IS ' + $Guess + ' you had ' + $Repeats + ' tries' 
}
else 
{
    # If user is not correct while number of tries has finished, run this
    ''
    'Sorry, you lose. It was ' + $Guess + ' you had ' + $Repeats + ' tries'
}