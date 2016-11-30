<#
	My Function
#>
function Connect-VDRAPI
{
	[CmdletBinding()]
	param (    
    [Parameter(ParameterSetName = "by_ip", Mandatory = $true)][system.net.ipaddress]$vdr_ip,
    [Parameter(ParameterSetName = "by_name", Mandatory = $true )][string]$vdr_name,
    [Parameter(ParameterSetName = "by_ip", Mandatory = $false)]
    [Parameter(ParameterSetName = "by_name", Mandatory = $false)][string]$vdr_port=8002
	)

#$private:function = $MyInvocation.MyCommand.Name.Substring(7)

switch ($PsCmdlet.ParameterSetName)
{
	"by_ip"
	{
	$global:vdr_base_url = "http://$($vdr_ip):$($vdr_port)"
	}
	"by_name"
	{ 
	$global:vdr_base_url = "http://$($vdr_name):$($vdr_port)"
	}
}

$private:uri = "$global:vdr_base_url/info.json"
$global:vdr_info_uri = $private:uri
$global:vdr_recordings_uri = "$global:vdr_base_url/recordings.json"
$global:vdr_remote_uri = "$global:vdr_base_url/remote"
$global:vdr_channels_uri = "$global:vdr_base_url/channels.json"

try
	{
	$myinfo = invoke-restcall -uri $uri -Verbose:($PSBoundParameters['Verbose'] -eq $true)
	}
catch
	{
	Write-Host "something went wrong"
	}

$myinfo | select version, services 
}
