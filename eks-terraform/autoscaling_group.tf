resource "aws_autoscaling_group" "demo" {
  desired_capacity     = 2
  launch_configuration = aws_launch_configuration.demo.id
  max_size             = 2
  min_size             = 1
  name                 = "terraform-eks-demo"
  vpc_zone_identifier  = aws_subnet.demo.*.id

  tag {
    key                 = "Name"
    value               = "terraform-eks-demo"
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/${var.cluster-name}"
    value               = "owned"
    propagate_at_launch = true
  }
}