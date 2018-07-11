



resource "aws_key_pair" mykey {
  key_name = "mykey"
  public_key = "${file(var.PATH_TO_PUBLIC_KEY)}"
}

# Create a build server
resource "aws_instance" "build" {

  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.mykey.key_name}"

  tags {
    Name = "Build-Machine"
  }


    provisioner "file" {
    source      = "../ansible"
    destination = "/home/ubuntu"

    connection {
      user = "ubuntu"
      private_key = "${file(var.PATH_TO_PRIVATE_KEY)}"
      
    }

  } 

  #   provisioner "file" {

  #   source = "../ansible"
  #   destination = "/home/ubuntu"

  #   connection {
  #     user = "ubuntu"
  #     private_key = "mykey"
  #   }
    
  # }
    
}

# # Create a deploy server
# resource "aws_instance" "deploy" {

#   ami = "${lookup(var.AMIS, var.AWS_REGION)}"
#   instance_type = "t2.micro"
#   key_name = "${aws_key_pair.mykey.key_name}"

#   tags {
#     Name = "Deploment-Machine"
#   }
    
# }


