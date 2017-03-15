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

Function Format-FileSize() {
    Param ([int]$Size)
    If     ($Size -gt 1TB) {[string]::Format("{0:0.00} TB", $Size / 1TB)}
    ElseIf ($Size -gt 1GB) {[string]::Format("{0:0.00} GB", $Size / 1GB)}
    ElseIf ($Size -gt 1MB) {[string]::Format("{0:0.00} MB", $Size / 1MB)}
    ElseIf ($Size -gt 1KB) {[string]::Format("{0:0.00} kB", $Size / 1KB)}
    ElseIf ($Size -gt 0)   {[string]::Format("{0:0.00} B", $Size)}
    Else                   {"$Size"}
}

$CachePath = Resolve-Path $Cache

If (-Not (Test-Path $CachePath)) {
	Throw "Specified path $CachePath does not exist"
}

$CacheProjects = Get-ChildItem $CachePath -Directory

ForEach ($CacheProject in $CacheProjects) {
	$CacheProjectSize = Get-ChildItem | Measure-Object -Sum Length | Select-Object Sum
	Write-Output "Project: $CacheProject = $(Format-FileSize $CacheProjectSize.Sum)"
}