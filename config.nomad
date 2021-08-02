job "test" {
    type = "service"
    datacenters = ["dc1"]

    group "server" {
        count = 3

        update {
            stagger = "30s"
            max_parallel = 1
        }

        task "server" {
            driver = "docker"

            config {
                image = "test"
            }
        }
    }
}