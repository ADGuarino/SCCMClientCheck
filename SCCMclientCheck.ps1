$a = new-object -comobject wscript.shell 
[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') 
$Computer = [Microsoft.VisualBasic.Interaction]::InputBox('Enter the Computer Name', 'SCCM Client Check')

$Service = Get-Service -Name 'sms agent host' -ComputerName $Computer -ErrorAction SilentlyContinue
if ($service.Status -eq "Running") {
$a.popup("SCCM Client is installed and healthy on $Computer")
Exit
}
Else {
$a.popup("$Computer is missing SCCM Client.")
Exit
}





