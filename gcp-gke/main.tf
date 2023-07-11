# Resource: GKE Cluster
resource "google_container_cluster" "gke_cluster" {
  name                      = var.gke_cluster_name
  location                  = var.subnet_region
  remove_default_node_pool  = true
  description               = var.description
  network                   = var.network
  subnetwork                = var.subnetwork
  project                   = var.project_id 

  addons_config {
    http_load_balancing {
        disabled = !var.http_load_balancing
    }
  }

  release_channel {
    channel = var.release_channel
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = var.gke_node_pool_name
  location   = var.subnet_region
  cluster    = google_container_cluster.gke_cluster.name
  project    = var.project_id 

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  management {
    auto_upgrade              = var.auto_upgrade
    auto_repair               = var.auto_repair 
  }

  node_config {
    preemptible  = true
    machine_type = var.gke_node_pool_machine_type
    
    disk_type                 = var.disk_type
    disk_size_gb              = var.disk_size_gb
  }
}