output "hosts" {
  value = [
    for e in local.servers : {
      name = e.name,
      ip   = e.network_interface[0].nat_ip_address
    }
  ]
}

locals {
  servers = flatten([
    yandex_compute_instance.clickhouse[*],
    yandex_compute_instance.lighthouse[*],
    yandex_compute_instance.vector[*]
    ]
  )
}
