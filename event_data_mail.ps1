"""any event id here"""
$EventId = 4720

$A = Get-WinEvent -MaxEvents 1  -FilterHashTable @{Logname = "Security" ; ID = $EventId}
$Message = $A.Message
$EventID = $A.Id
$MachineName = $A.MachineName
$Source = $A.ProviderName


$EmailFrom = "testuser1811@softbalance.ru"
$EmailTo = "my_name@my_domain.com, another_name@my_domain.com"
$Subject ="Создание учетной записи на $MachineName"
$Body = "EventID: $EventID`nSource: $Source`nMachineName: $MachineName `nMessage: $Message"
$SMTPServer = "mail.domain_name.ru"
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 25)
$SMTPClient.EnableSsl = $false
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("testuser1811@domain_name.ru", "Passwordhere");
$SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)