$username = 'domain\userName'
$password = Read-Host 'Input LAPS password'

Start-Process Powershell runas

$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential $username, $securePassword

Start-Process '\\usnycsrv2uwfp1\upf\rpusey-sa\WF\RF\Documents\PowerShell building\User Group Look up\User Group Look up.ps1' -Credential $credential

netsh interface ip set dns "Wi-Fi" dhcp
netsh interface ip set dns "Ethernet" dhcp
netsh interface ip set dns "Ethernet 4" dhcp