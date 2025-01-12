variable "files" {
  type = map(string)
  default = {
    "example1.txt" = "Hello, this is example 1",
    "example2.txt" = "Hello, this is example 2",
    "example3.txt" = "Hello, this is example 3"
  }
}

resource "local_file" "example" {
  for_each = var.files
  filename = "${path.module}/sample_dir/${each.key}"
  content = each.value
}

data "archive_file" "multi_file_zip" {
  type = "zip"
  source_dir = "${path.module}/sample_dir"
  output_path = "${path.module}/sample_dir.zip"
  depends_on = [local_file.example]
}

output "multi_zip_output" {
  value = "${local_file.example}"
  sensitive = true # this allow us to view the sensitive local_file.example
  # altho this probably wont be used much in an actual cloud db unless you
  # really really need to see what is in there
}
