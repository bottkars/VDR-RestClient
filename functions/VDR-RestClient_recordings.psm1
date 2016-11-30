function Get-VDRrecordings
{
[CmdletBinding()]
	param (    
    [Parameter(Mandatory = $false)]$vdr_recordings_uri = $global:vdr_recordings_uri
	)
$private:function = $MyInvocation.MyCommand.Name.Substring(7)
try
	{
	$myinfo = invoke-restcall -uri $vdr_recordings_uri -verbose:($PSBoundParameters['Verbose'] -eq $true)
	}
catch
	{
	Write-Host "something went wrong"
	}
#$myinfo.vdr.$private:function | Add-Member -TypeName "VDR$($private:function)"
$myinfo.$private:function | ft
}




