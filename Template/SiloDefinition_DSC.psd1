@{
    AllNodes = @(
        @{
            NodeName = "localhost"
            Role = "ProfileServer"
            Partition = "E"
            RootFolder = "Profiles"
            Farms = @(
                @{
					FarmName = "Test"
                    Silos = @(
                        @{
                            SiloName = "Silo-1"
                            SiloUserGroup = "testuser"
                        }
                        @{
                            SiloName = "Silo-2"
                            SiloUserGroup = "Users"
                        }
                        @{
                            SiloName = "Silo-3"
                            SiloUserGroup = "Users"
                        }
                    )
                }
                @{
					FarmName = "Beta"
                    Silos = @(
                        @{
                            SiloName = "Silo-1"
                            SiloUserGroup = "testuser"
                        }
                        @{
                            SiloName = "Silo-2"
                            SiloUserGroup = "Users"
                        }
                        @{
                            SiloName = "Silo-3"
                            SiloUserGroup = "Users"
                        }
                    )
                }
                @{
					FarmName = "Prod"
                    Silos = @(
                        @{
                            SiloName = "Silo-1"
                            SiloUserGroup = "testuser"
                        }
                        @{
                            SiloName = "Silo-2"
                            SiloUserGroup = "Users"
                        }
                        @{
                            SiloName = "Silo-3"
                            SiloUserGroup = "Users"
                        }
                    )
                }
            )
        }
    )
}