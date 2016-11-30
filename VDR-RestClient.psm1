<#
	My Function
#>
function Connect-VDRAPI
{
	param (    
    [Parameter(ParameterSetName = "by_ip", Mandatory = $true)][system.net.ipaddress]$vdr_ip,
    [Parameter(ParameterSetName = "by_name", Mandatory = $true )][string]$vdr_name,
    [Parameter(ParameterSetName = "by_ip", Mandatory = $false)]
    [Parameter(ParameterSetName = "by_name", Mandatory = $false)][string]$vdr_port=8002
	)
$global:vdr_base_url = "http://$($vdr_ip):$($vdr_port)"
#$private:function = $MyInvocation.MyCommand.Name.Substring(7)
$private:uri = "$global:vdr_base_url/info.json"
$global:vdr_info_uri = $private:uri

try
	{
	$myinfo = invoke-vdrrestcall -uri $uri
	}
catch
	{
	Write-Host "something went wrong"
	}

$myinfo | select version, services 
}

function Get-VDRdevices
{
	param (    
    [Parameter(Mandatory = $false)]$vdr_basedurl = $global:vdr_info_uri
	)
$private:function = $MyInvocation.MyCommand.Name.Substring(7)
try
	{
	$myinfo = invoke-vdrrestcall -uri $global:vdr_info_uri
	}
catch
	{
	Write-Host "something went wrong"
	}

$myinfo.vdr.$private:function | ft
}

function Get-VDRplugins
{
	param (    
    [Parameter(Mandatory = $false)]$vdr_basedurl = $global:vdr_info_uri
	)
$private:function = $MyInvocation.MyCommand.Name.Substring(7)
try
	{
	$myinfo = invoke-vdrrestcall -uri $global:vdr_info_uri
	}
catch
	{
	Write-Host "something went wrong"
	}

$myinfo.vdr.$private:function | ft
}

function Get-VDRversion
{
	param (    
    [Parameter(Mandatory = $false)]$vdr_basedurl = $global:vdr_info_uri
	)
$private:function = $MyInvocation.MyCommand.Name.Substring(7)
try
	{
	$myinfo = invoke-vdrrestcall -uri $global:vdr_info_uri
	}
catch
	{
	Write-Host "something went wrong"
	}

$myinfo.vdr.$private:function | ft
}



function invoke-vdrrestcall
{
 param ([Parameter(ParameterSetName = "uri", Mandatory = $true)]$uri
 )

 try
	{
	$private:call = Invoke-RestMethod $uri -Method GET
	}
catch
	{
	throw "something went wrong in function $($MyInvocation.MyCommand.Name) "
	}
return $private:call
}