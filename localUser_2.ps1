$localuser = Get-LocalUser 

#foreach($user in $localuser)
#{
 #   'My name is ' + $user.Name
#}

$localuser[-1].Name

# Get the number of items in the array
$localuser.Count