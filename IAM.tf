resource "aws_iam_role_policy" "s3-read-write_policy" {
  name = "s3-read-write_policy"
  role = aws_iam_role.ec2-s3_role.id
  policy = "${file("s3-read-write_policy.json")}"
}

resource "aws_iam_role" "ec2-s3_role" {
  name = "ec2-s3_role"
  assume_role_policy = "${file("ec2-assume-role.json")}"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = "${aws_iam_role.ec2-s3_role.name}"
}

provider "aws" {
    region = "eu-central-1"
}