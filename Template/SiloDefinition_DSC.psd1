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
                        }
                        @{
                            SiloName = "Silo-2"
                        }
                        @{
                            SiloName = "Silo-3"
                        }
                    )
                }
                @{
					FarmName = "Beta"
                    Silos = @(
                        @{
                            SiloName = "Silo-1"
                        }
                        @{
                            SiloName = "Silo-2"
                        }
                        @{
                            SiloName = "Silo-3"
                        }
                    )
                }
                @{
					FarmName = "Prod"
                    Silos = @(
                        @{
                            SiloName = "Silo-1"
                        }
                        @{
                            SiloName = "Silo-2"
                        }
                        @{
                            SiloName = "Silo-3"
                        }
                    )
                }
            )
        }
    )
}