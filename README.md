# DaVinci Resolve Tools

This repository contains tools to help manage DaVinci Resolve cache folders.

## Get-DaVinciResolveCacheProjects.ps1

This script returns the list of cached projects and their size.

Usage: `.\Get-DaVinciResolveCacheProject.ps1 -Cache C:\Cache`

You can use PowerShell tools to filter and simplify the output:

    .\Get-DaVinciResolveCacheProjects.ps1 -Cache C:\Cache | Sort-Object Bytes | Format-Table -Property "Project Name",Size,Path

## License

Copyright (c) 2017 Christian Rondeau, under the [MIT License](LICENSE.md)
