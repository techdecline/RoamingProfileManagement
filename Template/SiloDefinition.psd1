@{
    AllNodes = @(
        @{
            Farm = @(
                @{
                    FarmName = "Test"
                    NodeName = "localhost"
                    Partition = "D"
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
                    NodeName = "localhost"
                    Partition = "D"
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
                    NodeName = "localhost"
                    Partition = "D"
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