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
```powershell
Import-Module .\Get-PrinterMIB.ps1
```
Call the function with a valid IP address of a printer:
```powershell
Get-PrinterMIB -Printer <IPAddress>
```
## Example 
```
PS C:\> Get-PrinterMIB -Printer 10.0.0.1

HostName     : printer1
PageCount    : 169112
Trays        : {TRAY 1, TRAY 2}
Model        : HP LaserJet P4015
SerialNumber : ######
TonerDetails : {...}

Description                                 CurrentLevels
-----------                                 -------------
Black Cartridge HP CC364X                   90.00%       
Maintenance Kit HP 110V-CB388A, 220V-CB389A 69.20%       

```
## Note
The function assumes that the printer is accessible via SNMP with the community name "public". The SNMP version used is 2 and the timeout value is 3000 milliseconds.
