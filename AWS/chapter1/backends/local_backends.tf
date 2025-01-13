# The terraform block is used to configure the various aspects of how Terraform would behave
terraform {
  # Here we are telling terraform that our backend is on a local disk
  backend "local" {
    # Here we specified a path to store it in which is in the directory .cache
    path = ".cache/terraform.tfstate"
  }
}

# Create a local file example.txt file
resource "local_file" "example" {
  content = "Local File Sample\n"
  filename = "${path.module}/example.txt"
}

/*
 *  Interesting to note about the path, if the directory does not exist terraform will
 *  create one.
 */
