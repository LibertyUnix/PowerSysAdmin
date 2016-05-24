$mac = get-wmiobject -class "Win32_NetworkAdapterConfiguration" -computername $args |Where{$_.IpEnabled -Match "True"}
Write-Host $mac.macaddress