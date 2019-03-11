@{
    AllNodes = @(
        @{
            NodeName = "localhost"
            Partition = "D"
            RootFolder = "Profiles"
            Farm = @(
                @{
					FarmName = "Test"
                    Silo = @(
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
                    Silo = @(
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
                    Silo = @(
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