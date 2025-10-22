# SABnzbdPortable

Packages the binary newsreader [SABnzbd](https://sabnzbd.org/) into a [Portable Apps](https://portableapps.com/development) application. This allow to run SABnbzbd from a USB drive and not make any changes to the Windows environment.

## Configure Powershell

The packaging script uses PowerShell. Windows defaults to not run PowerShell scripts. Open an Administrative command-line and execute the following to allow execution of PowerShell scripts.

``` code
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
```

## Packaging

Execute the following from a Powershell terminal.

``` code
.\package.ps1
```
