<#
.SYNOPSIS 
	Displays the list of all projects in the DaVinci Resolve cache
.EXAMPLE
	Get-DavinciResolveCacheProjects.ps1 -cache C:\Cache
#>

[CmdletBinding()]
Param(
	[Parameter(Mandatory=$true)]
	[String] $Cache
)

Set-StrictMode -version Latest
$ErrorActionPreference = "Stop"

$CachePath = Resolve-Path $Cache

If (-Not (Test-Path $CachePath)) {
	Throw "Specified path $CachePath does not exist"
}

$CacheProjects = Get-ChildItem $CachePath -Directory

ForEach ($CacheProject in $CacheProjects) {
	Write-Output "Project: $CacheProject"
}
