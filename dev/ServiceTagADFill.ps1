#Dell Asset Tag to hostname matchup in AD
#Script By: Scott Forsyth
#Last Date modified: 12/21/2015

Import-Module ActiveDirectory

#grabs dell asset tag from command line
wmic bios get serialnumber

$Computers = get-adcomputer -filter * | ForEach-Object {_.Name}

foreach ($i in $Computers) {
	Invoke-Command -Computername $i -ScriptBlock { wmic bios get serialnumber }
}	Get-WmiObject win32_SystemEnclosure -computername $i | select serialnumber

#area to edit out vmware serials
#if serial variable contains "vmware", then disregard.