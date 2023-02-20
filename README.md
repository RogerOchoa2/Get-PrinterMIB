# PowerShell Script: Get-PrinterSNMPData

## Description
This PowerShell script gets toner descriptions, toner maximum levels, toner current levels, page count, tray information, model, serial number, and host name from a printer using SNMP.

## Prerequisites
- Windows operating system
- PowerShell version 5.0 or later
- Access to the printer via SNMP


## Installation
1. Clone or download the repository to your local machine.
2. Open a PowerShell console.
3. Navigate to the directory where the script is saved.
4. Run the script by entering .\Get-PrinterSNMPData.ps1 -Printer <IP_Address_or_Hostname>


## Usage
To run the script, open a PowerShell console and enter the following command:
```powershell
.\Get-PrinterSNMPData.ps1 -Printer <IP_Address_or_Hostname>
```
Replace <IP_Address_or_Hostname> with the IP address or hostname of the printer you want to retrieve data from.
The script will retrieve the following information from the printer:

- Host name
- Page count
- Trays
- Model
- Serial number
- Toner details (description and current level percentage)

The script will return the information in a custom object.


## Contributing
Contributions are welcome. Feel free to submit a pull request or open an issue if you find a bug or have a suggestion.

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
