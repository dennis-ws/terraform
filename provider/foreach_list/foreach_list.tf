# In the case of for_each, this function can only be used on set and key since there is always a uniquely different key value
# However this is not the case for list. In order to allow for_each to act upon a list, we will need to convert it to a set
# with 'toset'
variable "name" {
  default = ["example1", "example2", "example3"]
}

resource "local_file" "example" {
  for_each = toset(var.name)
  filename = "${path.module}/${each.key}"
  content = "Some random text"
}

output "foreach_list_output" {
  value = "Done!"
}
