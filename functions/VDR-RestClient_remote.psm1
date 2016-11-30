function Set-VDRremoteKey
{
[CmdletBinding()]
	param (    
    [Parameter(Mandatory = $true, Position = 1)]$key,
	[Parameter(Mandatory = $false)]$vdr_remote_uri = $global:vdr_remote_uri
	
	)
$private:function = $MyInvocation.MyCommand.Name.Substring(7)
try
	{
	$myinfo = invoke-restcall -uri "$vdr_remote_uri/$key" -method POST -verbose:($PSBoundParameters['Verbose'] -eq $true)
	}
catch
	{
	$_.Exception
	Write-Host "something went wrong"
	}
#$myinfo.vdr.$private:function | Add-Member -TypeName "VDR$($private:function)"
$myinfo #.$private:function | ft
}


function Switch-VDRremote
{
[CmdletBinding()]
	param (    
    [Parameter(Mandatory = $false)]$vdr_remote_uri = $global:vdr_remote_uri,
	[Parameter(Mandatory = $true,ValueFromPipelineByPropertyName = $true)][alias('channel')]$channel_id
	)
$private:function = $MyInvocation.MyCommand.Name.Substring(7)

try
	{
	$myinfo = invoke-restcall -uri "$vdr_remote_uri/switch/$channel_id" -method POST -verbose:($PSBoundParameters['Verbose'] -eq $true)
	}
catch 
	{
	Write-Host "something went wrong"
	}
#$myinfo.vdr.$private:function | Add-Member -TypeName "VDR$($private:function)"
$myinfo 
}



