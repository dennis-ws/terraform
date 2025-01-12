provider "local" {
}

resource "local_file" "example" {
  content = "Local provider test 2"
  filename = "${path.module}/example.txt"
}

output "provider_output" {
  value = "Finished! example.txt was created at ${path.module}"
}
