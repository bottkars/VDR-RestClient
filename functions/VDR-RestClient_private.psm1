function invoke-restcall
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



Function Convert-FromUnixdate ($UnixDate) {
   [timezone]::CurrentTimeZone.ToLocalTime(([datetime]'1/1/1970').`
   AddSeconds($UnixDate))
}

