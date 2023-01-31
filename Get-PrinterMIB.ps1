# Define a function to get SNMP data from a printer
Function Get-PrinterMIB {
  Param($Printer)

  #Function to clean up raw MIB values
  Function MIBCleanup ($object) {
    #Split raw data into separate lines
    $raw = $object
    $split = $raw -split [Environment]::NewLine
    #Remove unwanted lines
    $MibValReg = $split -notmatch "(?<=printmib)"

    #Return filtered data
    return $MibValReg
  } 
        
    # Create an instance of the SNMP object
    $SNMP = New-Object -ComObject olePrn.OleSNMP

    # Open a connection to the printer using the specified IP address, community name, version, and timeout value
    $SNMP.open("$Printer","public",2,3000)
        
        
    # Get and store the toner descriptions, toner maximum levels, and toner current levels
    $TonerDescriptions = MIBCleanup ($SNMP.gettree(".1.3.6.1.2.1.43.11.1.1.6"))
    $TonerMax = MIBCleanup ($SNMP.gettree(".1.3.6.1.2.1.43.11.1.1.8"))  
    $TonerLevels = MIBCleanup ($SNMP.gettree(".1.3.6.1.2.1.43.11.1.1.9"))


    # Get and store the page count and tray information
    $PageCount = MIBCleanup ($snmp.gettree('.1.3.6.1.2.1.43.10.2.1.4'))
    $Trays =  MIBCleanup ($snmp.GetTree('.1.3.6.1.2.1.43.8.2.1.13'))
    
    # Get and store the model and serial number
    $Model = ($snmp.Get('.1.3.6.1.2.1.25.3.2.1.3.1')) #No format
    $SerialNumber = ($snmp.Get('.1.3.6.1.2.1.43.5.1.1.17.1')) #No format

    # Get and store the host name
    $HostName = (($snmp.gettree('.1.3.6.1.2.1.1.5')) -split "`n")[1]
        
        
    # Create an array to store the toner details
    $TonerDetails = @()

    # Loop through each toner description to get the corresponding toner percent
    foreach ($TD in  $TonerDescriptions) { 
        # Get the index of the current toner description
        $i = [array]::IndexOf($TonerDescriptions, $TD)

        # Calculate the toner percent
        $TonerPercent = ($TonerLevels[$i]/$TonerMax[$i]).tostring("P")

        # Add the toner details to the array
        $TonerDetails += [PSCustomObject]@{
            Description = $TD
            CurrentLevels = if ($TonerPercent -match "-\d+%") { $TonerPercent = 0 } elseif ($false) { $TonerPercent } else { $TonerPercent }
        }
    }


    # Create a custom object to store all the results
    $results = [PSCustomObject]@{
        HostName = $HostName
        PageCount = $PageCount
        Trays = $Trays
        Model = $Model
        SerialNumber = $SerialNumber
        TonerDetails = $TonerDetails
             
           }
        
        
        return $results
        
        
        }