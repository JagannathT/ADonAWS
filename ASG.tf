/*
resource "aws_autoscaling_group" "ad_asg" {
  max_size = 2
  min_size = 2
  launch_configuration = "${aws_launch_configuration.ad-asg-lc.id}"
  availability_zones = ["us-west-2a"]
  vpc_zone_identifier = ["${aws_subnet.us-west-2a.id}"]
}
*/
