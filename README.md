# DaVinci Resolve Tools

This repository contains tools to help manage DaVinci Resolve cache folders.

## Installing

1. Start a PowerShell session
2. Run `Set-ExecutionPolicy RemoteSigned`
3. Clone this repository or simply download the scripts you need to run (in GitHub, click on the `.ps1` file you want, click on the `Raw` button and save the file with a `.ps1` extension)

## Get-DaVinciResolveCacheProjects.ps1

This script returns the list of cached projects and their size.

Usage: `.\Get-DaVinciResolveCacheProject.ps1 -Cache C:\Cache`

You can use PowerShell tools to filter and simplify the output:

    .\Get-DaVinciResolveCacheProjects.ps1 -Cache C:\Cache | Sort-Object Bytes | Format-Table -AutoSize -Property "Project Name",Size,Path

## License

Copyright (c) 2017 Christian Rondeau, under the [MIT License](LICENSE.md)
