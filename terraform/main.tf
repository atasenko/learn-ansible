module "vpc_develop" {
  source      = "./vpc-local"
  env_name    = var.env_name
  subnet_zone = var.default_zone
  cidr        = var.default_cidr
}

resource "yandex_compute_instance" "vm" {
  count       = 1
  name        = "${var.vm_name}-0${count.index+1}"

  resources {
    cores         = var.vm_web_resources.cores
    memory        = var.vm_web_resources.memory
    core_fraction = var.vm_web_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.my_image.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = module.vpc_develop.subnet_ids
    nat       = true
  }

  metadata = {
    ssh-keys  = local.ssh-key
    serial-port-enable = 1
  }
}
