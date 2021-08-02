job "test" {
    type = "service"
    datacenters = ["dc1"]

    group "server" {
        count = 3

        update {
            stagger = "30s"
            max_parallel = 1
        }

        network {
            port "http" {
                to = 8081
            }
        }

        task "server" {
            driver = "docker"

            config {
                ports = ["http"]
                image = "ghcr.io/spiralw/nomad-test:master"
            }
        }
    }
}