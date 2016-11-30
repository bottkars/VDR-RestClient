function Get-VDRchannels
{
[CmdletBinding()]
	param (    
    [Parameter(Mandatory = $false)]$vdr_channels_uri = $global:vdr_channels_uri
	)
$private:function = $MyInvocation.MyCommand.Name.Substring(7)
try
	{
	$myinfo = invoke-restcall -uri $vdr_channels_uri -verbose:($PSBoundParameters['Verbose'] -eq $true)
	}
catch
	{
	Write-Host "something went wrong"
	}
#$myinfo.vdr.$private:function | Add-Member -TypeName "VDR$($private:function)"
$myinfo.$private:function 
}




