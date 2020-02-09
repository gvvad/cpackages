$ErrorActionPreference = 'Stop';

Get-Process -Name "victoria" -ErrorAction Ignore | Stop-Process -ErrorAction Ignore
