data "archive_file" "single_file_zip" {
  type = "zip"
  source_file = "${path.module}/hello_world.py"
  output_path = "${path.module}/single_file.zip"
}
