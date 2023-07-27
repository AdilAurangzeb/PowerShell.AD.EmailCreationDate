Import-Module ActiveDirectory

Write-Host "Checks creation date" -ForegroundColor green


# Import email list
$emailList = Get-Content -Path '.\emailList.txt'


$details = @()

foreach ($email in $emailList)
{
    $lookupEmail = Get-ADUser -Filter {Emailaddress -eq $email} -Properties whenCreated | Select Name,SamAccountName,UserPrincipalName,whenCreated
    $details = $details + $lookupEmail
}


$details | export-CSV ".\details.csv" -NoTypeInformation