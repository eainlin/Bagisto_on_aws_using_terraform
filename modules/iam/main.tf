#====================
# IAM
#====================
data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "ec2_role" {
  name               = var.ec2_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "ec2_role_attachment" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = var.ec2_role_policy_arn
}


resource "aws_iam_instance_profile" "ec2_ssm" {
  name = var.ec2_instance_profile_name
  role = aws_iam_role.ec2_role.name
}
