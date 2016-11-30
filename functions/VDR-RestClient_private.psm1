function invoke-restcall
{
[CmdletBinding()]
param (
	[Parameter(ParameterSetName = "uri", Mandatory = $true)]$uri,
	[Parameter(ParameterSetName = "uri", Mandatory = $false)]
	[ValidateSet('GET','PUT','POST')]
	$method = 'GET'
 )

 try
	{
	$private:call = Invoke-RestMethod $uri -Method $method
	}
catch
	{
	write-host $_.Exception
	throw "something went wrong in function $($MyInvocation.MyCommand.Name) "
	}
return $private:call
}



Function Convert-FromUnixdate ($UnixDate) {
   [timezone]::CurrentTimeZone.ToLocalTime(([datetime]'1/1/1970').`
   AddSeconds($UnixDate))
}

