function Get-VDRdevices
{
	param (    
    [Parameter(Mandatory = $false)]$vdr_basedurl = $global:vdr_info_uri
	)
$private:function = $MyInvocation.MyCommand.Name.Substring(7)
try
	{
	$myinfo = invoke-restcall -uri $global:vdr_info_uri
	}
catch
	{
	Write-Host "something went wrong"
	}
$myinfo.vdr.$private:function | Add-Member -TypeName "VDR$($private:function)"
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
	$myinfo = invoke-restcall -uri $global:vdr_info_uri
	}
catch
	{
	Write-Host "something went wrong"
	}

$myinfo.vdr.$private:function | Add-Member -TypeName "VDR$($private:function)"
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
	$myinfo = invoke-restcall -uri $global:vdr_info_uri
	}
catch
	{
	Write-Host "something went wrong"
	}
$myinfo.vdr.$private:function | Add-Member -TypeName "VDR$($private:function)"
$myinfo.vdr.$private:function | ft
}

function Get-VDRinfo
{
	param (    
    [Parameter(Mandatory = $false)]$vdr_basedurl = $global:vdr_info_uri
	)
$private:function = $MyInvocation.MyCommand.Name.Substring(7)
try
	{
	$myinfo = invoke-restcall -uri $global:vdr_info_uri
	}
catch
	{
	Write-Host "something went wrong"
	}

Write-Host " ==> current VDR Info"

$VDR_INFO = New-Object psobject 
$VDR_INFO | Add-Member -TypeName "VDRInfo"
$VDR_INFO | Add-Member -MemberType NoteProperty -Name "Systemtime" -Value (Convert-FromUnixdate $($myinfo.time))
$VDR_INFO | Add-Member -MemberType NoteProperty -Name "Program Starttime" -Value (Convert-FromUnixdate $($myinfo.start_time))
$VDR_INFO | Add-Member -MemberType NoteProperty -Name "Channel" -Value $myinfo.channel
$VDR_INFO | Add-Member -MemberType NoteProperty -Name "Title" -Value $myinfo.title


$VDR_INFO
}


