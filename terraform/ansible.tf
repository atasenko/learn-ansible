resource "local_file" "ansible_prod_hosts" {
  content = templatefile("${path.module}/prod.tftpl",
    {
      clickhouse = yandex_compute_instance.clickhouse.*,
      lighthouse = yandex_compute_instance.lighthouse.*,
      vector     = yandex_compute_instance.vector.*
    }
  )

  filename = "${path.module}./playbook/inventory/prod.yml"
}
