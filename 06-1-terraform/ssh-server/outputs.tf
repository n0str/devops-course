output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.ssh_server.id
}

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.ssh_server.id
}
