#
# Module 'Dynamite.PowerShell.Toolkit'
# Generated by: GSoft, Team Dynamite.
# Generated on: 10/24/2013
# > GSoft & Dynamite : http://www.gsoft.com
# > Dynamite Github : https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit
# > Documentation : https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit/wiki
#

<#
	.SYNOPSIS
		Method to get the value of a property (key-value pair) in the SharePoint Web Application property bag.

	.DESCRIPTION
		Method to get the value of a property (key-value pair) in the SharePoint Web Application property bag.

    --------------------------------------------------------------------------------------
    Module 'Dynamite.PowerShell.Toolkit'
    by: GSoft, Team Dynamite.
    > GSoft & Dynamite : http://www.gsoft.com
    > Dynamite Github : https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit
    > Documentation : https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit/wiki
    --------------------------------------------------------------------------------------
    
	.PARAMETER  Url
		The Url of the SharePoint WebApplication

	.PARAMETER  Key
		The Key of the property to get.

	.EXAMPLE
		PS C:\> Get-DSPWebAppProperty -Url http://myurl -Key 'MyKey'

	.INPUTS
		System.String, System.String

	.OUTPUTS
		System.String
        
  .LINK
    GSoft, Team Dynamite on Github
    > https://github.com/GSoft-SharePoint
    
    Dynamite PowerShell Toolkit on Github
    > https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit
    
    Documentation
    > https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit/wiki
    
#>
function Get-DSPWebAppProperty()
{
	[CmdletBinding()]
	Param
  (
		[Parameter(Mandatory=$true)]
		[string]$Url,
		
		[Parameter(Mandatory=$true)]
		[string]$Key
	)
	
	$SPWebApp = Get-SPWebApplication -Identity $Url
	return $SPWebApp.Properties[$Key]
}

<#
	.SYNOPSIS
		Method to set the value of a property (key-value pair) in the SharePoint Web Application property bag.

	.DESCRIPTION
		Method to set the value of a property (key-value pair) in the SharePoint Web Application property bag.

    --------------------------------------------------------------------------------------
    Module 'Dynamite.PowerShell.Toolkit'
    by: GSoft, Team Dynamite.
    > GSoft & Dynamite : http://www.gsoft.com
    > Dynamite Github : https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit
    > Documentation : https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit/wiki
    --------------------------------------------------------------------------------------
    
	.PARAMETER  Url
		The Url of the SharePoint WebApplication

	.PARAMETER  Key
		The Key of the property to set.

	.PARAMETER  Value
		The value to insert at the Key.

	.EXAMPLE
		PS C:\> Set-DSPWebAppProperty -Url http://myurl -Key 'MyKey' -Value 'MyValue'

	.INPUTS
		System.String, System.String, System.Object

	.OUTPUTS
		System.String
        
  .LINK
    GSoft, Team Dynamite on Github
    > https://github.com/GSoft-SharePoint
    
    Dynamite PowerShell Toolkit on Github
    > https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit
    
    Documentation
    > https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit/wiki
    
#>
function Set-DSPWebAppProperty()
{
	[CmdletBinding()]
	Param
  (
		[Parameter(Mandatory=$true)]
		[string]$Url,
		
		[Parameter(Mandatory=$true)]
		[string]$Key,
		
		[Parameter(Mandatory=$true)]
		[string]$Value
	)
	
	$SPWebApp = Get-SPWebApplication -Identity $Url
	
	if (!$SPWebApp.Properties.ContainsKey($Key))
	{ 
    $SPWebApp.Properties.Add($Key, $Value);
	}
	else
	{
    $SPWebApp.Properties[$Key] = $Value;
	}                        
  
  $SPWebApp.Update();
}

function Set-DSPWebProperty()
{
	[CmdletBinding()]
	Param
	(
		[Parameter(Mandatory=$true)]
		[string]$Url,
		
		[Parameter(Mandatory=$true)]
		[string]$Key,
		
		[Parameter(Mandatory=$true)]
		[string]$Value
	)
	
	$SPWeb = Get-SPWeb -Identity $Url
	
	if ($SPWeb.GetProperty($Key) -eq $null)
	{ 
		$SPWeb.AddProperty($Key, $Value)
	}
	else
	{
		$SPWeb.SetProperty($Key, $Value)
	}                        
  
  $SPWeb.Update();
}

function Get-DSPWebProperty()
{
	[CmdletBinding()]
	Param
  (
		[Parameter(Mandatory=$true)]
		[string]$Url,
		
		[Parameter(Mandatory=$true)]
		[string]$Key
	)
	
	$SPWeb = Get-SPWeb -Identity $Url
	return $SPWeb.GetProperty($Key)
}