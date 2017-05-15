function Menu
{
     
     Write-Host "Press '1' Change password for account"
     Write-Host "Press '2' Disable user account"
     Write-Host "Press '3' Enable user account"
     Write-Host "Press '4' Unlock user account"
     Write-Host "Press '5' Delete user account"
     Write-Host "Press 'Q' to quit."

}    
do
{
     #Needed for interacting with AD 
     Import-Module ActiveDirectory
     $user=Read-Host "Enter AD username"
     $Name = $user
     #Check in LDAP if the user exists 
     $Usercheck = Get-ADUser -LDAPFilter "(SAMAccountName=$user)"
     If ($usercheck -eq $Null)
     {
     Write-Host "User does not exist in AD"
     }
     Else
     {
     Show-Menu –Title "Active Directory"
     $input = Read-Host "Select"
     #Switch case on the user input 
     switch ($input)
     {
           '1' {
                cls
                'This is for reset a user PW.'
                #AsSecureString creates a secure sting 
                $newpw=Read-Host "Enter the new password" -AsSecureString 
                Set-ADAccountPassword $user -NewPassword $newpw               
           } '2' {
                cls
                'User is now disabled'
                Disable-ADAccount $user
           } '3' {
                cls
                'User is now enabled'
                Enable-ADAccount $user
           } '4' {
                cls
                'User is now unlocked'
                Unlock-ADAccount $user
           } '5' {
                cls
                'User is now "deleted"'
                Remove-ADUser $user
           } 'q' {
                return
           }

     }
     pause
}
}
until ($input -eq 'q')