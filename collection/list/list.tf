variable "pet_name_list" {
    type = list(string)
    default = ["cat", "dog", "mouse"]
}

variable "pet_count_list" {
    type = list(number)
    default = [2, 3, 5]
}

output "pets_in_room" {
    value = [for pet in var.pet_name_list : "There is a ${pet} in the room."]
}

output "pets_in_room_count" {
    value = [for index, value in var.pet_count_list : "Index ${index} : ${var.pet_count_list[index]} = ${value}"]
}
