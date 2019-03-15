# Roaming Profile Management

## Description

This project contains PowerShell resources to automate creation and maintenance of profile locations in windows environments using Desired State Configuration Push Model.

## Use of this module
1. Download project resources to desired server.
2. Update / copy SiloDefinition_DSC.psd1 according to your requirements.
3. Update run-dscpilot.ps1 to use your changed PSD file.
4. Run run-dscpilot.ps1

## Remarks
* This structure may change at a later date and may add templates for Home Drives, UEV Data and other central user data locations using Composite Resources. Therefore, always check change log when updating to later versions.
* When you are already using DSC for server configuration using either Push or Pull model, you have to merge your existing config data and configurations with contents of this module.