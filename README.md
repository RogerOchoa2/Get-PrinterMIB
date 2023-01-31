Get-PrinterMIB
Function
The Get-PrinterMIB function retrieves and returns the following information about a printer using Simple Network Management Protocol (SNMP):

Host Name
Page Count
Tray Information
Model
Serial Number
Toner Details (Description, Current Levels)
Parameters
$Printer: IP address or hostname of the printer
Output
The function returns a custom object that contains the information listed above.

Example Usage
sql
Copy code
Get-PrinterMIB -Printer 192.168.0.100
Note
The function requires SNMP support on the printer.
The community name is hardcoded as "public".
The function uses version 2 of SNMP and a timeout value of 3000ms.