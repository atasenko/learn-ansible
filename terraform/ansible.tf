resource "local_file" "ansible_prod_hosts" {
  content = templatefile("${path.module}/prod.tftpl",
    {
      servers    = yandex_compute_instance.vm.*
    }
  )

  filename = "${path.module}./playbook/inventory/prod.yml"
}
