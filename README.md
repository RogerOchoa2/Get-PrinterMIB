Get-PrinterMIB
A PowerShell function to retrieve SNMP data from a printer.

## Functionality
The function retrieves various information from the printer such as:

- HostName
- PageCount
- Trays
- Model
- SerialNumber
- TonerDetails (including Description and CurrentLevels)


## Requirements
- OLEprn.dll


## Usage
1. Download the function file.

2. Import the function into your PowerShell session by running:
```
Import-Module .\Get-PrinterMIB.ps1
```
Call the function with a valid IP address of a printer:
```
Get-PrinterMIB -Printer <IPAddress>
```
## Example 
```
PS C:\> Get-PrinterMIB -Printer 10.0.0.1

HostName     : printer1
PageCount    : 1234
Trays        : Tray 1,Tray 2,Tray 3
Model        : HP LaserJet Pro M15w
SerialNumber : XYZ1234567
TonerDetails : 

Description CurrentLevels
---------- --------------
Toner Cartridge   100%
```
## Note
The function assumes that the printer is accessible via SNMP with the community name "public". The SNMP version used is 2 and the timeout value is 3000 milliseconds.
