# VDR-RestClient Powershell Modules
# 
#
##Description
the modules utilizes the VDR-RestAPI Plugin

##USAGE


load the module by Import-Module VDR-RestClient.psd1

Use the Function Connect-VDRAPI to connect to your VDR API

the call can be made using IP

```Powershell
Connect-VDRAPI -vdr_ip 192.168.1.100

version services                                                                                                                            
------- --------                                                                                                                            
0.2.6.5 {@{path=/info; version=1}, @{path=/channels; version=1}, @{path=/channels/groups; version=1}, @{path=/channels/image; version=1}...}
```

or name

```Powershell
Connect-VDRAPI -vdr_name yavdr-server.fritz.box

version services                                                                                                                            
------- --------                                                                                                                            
0.2.6.5 {@{path=/info; version=1}, @{path=/channels; version=1}, @{path=/channels/groups; version=1}, @{path=/channels/image; version=1}...}
```
optional, the API port can be specified with  -vdr_port

```Powershell
Connect-VDRAPI -vdr_name yavdr-server.fritz.box -vdr_port 8002

version services                                                                                                                            
------- --------                                                                                                                            
0.2.6.5 {@{path=/info; version=1}, @{path=/channels; version=1}, @{path=/channels/groups; version=1}, @{path=/channels/image; version=1}...}

```
Once the Connect-VDRAPI Call is done, the Scope to the RestAPI URI is set GLobally for all other calls

Current Supported Function are basic get commands to get Basig information from the API

##examples:

![image](https://cloud.githubusercontent.com/assets/8255007/20747773/a84b4834-b6eb-11e6-9c0f-44a82bd21258.png)




