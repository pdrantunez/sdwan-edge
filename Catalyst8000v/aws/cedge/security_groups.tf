/*
  Security Groups
*/


resource "aws_security_group" "transport" {

    vpc_id = data.aws_vpc.instance.id
    
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = -1
        cidr_blocks = ["0.0.0.0/0"]
    }    
        
    ingress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = "${var.acl_cidr_blocks}"
    }

    ingress {
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        self 	  = "true"
    } 

    tags = merge(
        var.common_tags,
        {
            Name = "sdwan - transport"
        }
    )
}

resource "aws_security_group" "service" {

    vpc_id = data.aws_vpc.instance.id

    egress {
        from_port   = 0
        to_port 	= 0
        protocol 	= -1
        cidr_blocks	= ["0.0.0.0/0"]
    }

    ingress {
        from_port 	= 0
        to_port 	= 0
        protocol 	= "-1"        
        cidr_blocks = ["0.0.0.0/0"]
    }   

    tags = merge(
        var.common_tags,
        {
            Name = "sdwan - service"
        }
    )
}

