configuration ProfileShare {
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName xSmbShare -ModuleVersion 2.1.0.0
    Import-DscResource -ModuleName cNtfsAccessControl -ModuleVersion 1.4.1

    node $AllNodes.Where{$_.Role -eq "ProfileServer"}.NodeName
    {
        File ProfileRoot
        {
            Ensure = "Present"
            DestinationPath = $node.Driveletter + ":\" + $node.RootFolder
            Type = "Directory"
        }

        cNtfsPermissionsInheritance "ProfileRoot_ACL_Inheritence" {
            Path = $node.DriveLetter + ":\" + $node.RootFolder
            Enabled = $false
            PreserveInherited = $true
        }

        cNtfsPermissionEntry "ProfileRoot_ACL_Admins" {
            Path = $node.Driveletter + ":\" + $node.RootFolder
            DependsOn = "[File]ProfileRoot"
            Principal = $node.AdminGroup
            Ensure = 'Present'
            AccessControlInformation = @(
                cNtfsAccessControlInformation
                {
                    AccessControlType = 'Allow'
                    FileSystemRights = 'FullControl'
                    Inheritance = 'ThisFolderSubfoldersAndFiles'
                    NoPropagateInherit = $false
                }
            )
        }

        foreach ($farm in $node.Farms) {
            File "FarmRoot_$($farm.FarmName)" {
                DependsOn = "[File]ProfileRoot"
                DestinationPath = $node.Driveletter + ":\" + $node.RootFolder + "\" + $Farm.FarmName
                Type =  "Directory"
            }

            xSmbShare "FarmShare_$($farm.FarmName)" {
                Name = $farm.FarmName + "$"
                Path = $node.Driveletter + ":\" + $node.RootFolder + "\" + $Farm.FarmName
                FullAccess = "Everyone"
            }

            foreach ($silo in $farm.Silos) {
                File "SiloRoot_$($farm.FarmName)_$($silo.SiloName)" {
                    DependsOn = "[File]ProfileRoot"
                    DestinationPath = $node.Driveletter + ":\" + $node.RootFolder + "\" + $Farm.FarmName + "\" + $silo.SiloName
                    Type =  "Directory"
                }

                cNtfsPermissionEntry "SiloRoot_$($farm.FarmName)_$($silo.SiloName)" {
                    Path = $node.Driveletter + ":\" + $node.RootFolder + "\" + $Farm.FarmName + "\" + $silo.SiloName
                    DependsOn = "[File]SiloRoot_$($farm.FarmName)_$($silo.SiloName)"
                    Principal = $silo.SiloUserGroup
                    Ensure = 'Present'
                    AccessControlInformation = @(
                        cNtfsAccessControlInformation
                        {
                            AccessControlType = 'Allow'
                            FileSystemRights = 'CreateDirectories','AppendData'
                            Inheritance = 'ThisFolderOnly'
                            NoPropagateInherit = $false
                        }
                        cNtfsAccessControlInformation
                        {
                            AccessControlType = 'Allow'
                            FileSystemRights = 'ListDirectory','ReadData'
                            Inheritance = 'ThisFolderOnly'
                            NoPropagateInherit = $false
                        }
                    )
                }
            }
        }
    }
}

ProfileShare -OutputPath C:\Code\Workbench -ConfigurationData .\Template\SiloDefinition_DSC.psd1
Start-DscConfiguration -Wait -Force -Verbose -Path C:\Code\Workbench