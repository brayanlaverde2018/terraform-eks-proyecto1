resource "aws_iam_role" "role" {
  name               = var.role_name
  assume_role_policy = jsonencode(var.assume_role_policy)

  tags = merge(
    var.tags,
    {
      Name = var.role_name
    }
  )
}

resource "aws_iam_policy" "custom_policy" {
  for_each = var.policy_files

  name   = "${var.role_name}-${each.key}"
  policy = file(each.value)
}

resource "aws_iam_role_policy_attachment" "attach_custom_policies" {
  for_each = aws_iam_policy.custom_policy

  role       = aws_iam_role.role.name
  policy_arn = each.value.arn
}

resource "aws_iam_role_policy_attachment" "attach_managed_policy" {
  count      = var.managed_policy_arn != "" ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.managed_policy_arn
}

