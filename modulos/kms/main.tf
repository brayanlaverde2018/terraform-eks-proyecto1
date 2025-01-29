resource "aws_kms_key" "this" {
  description             = var.description != "" ? var.description : "${var.aliascliente}-kms-${var.aliasproyecto}-${var.ambiente}"
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
  is_enabled              = var.is_enabled

  policy = var.custom_key_policy != "" ? var.custom_key_policy : data.aws_iam_policy_document.default_policy.json

  tags = merge(
    {
      Name       = "${var.aliascliente}-kms-${var.aliasproyecto}-${var.ambiente}"
      Proyecto   = var.aliasproyecto
      Cliente    = var.aliascliente
      Ambiente   = var.ambiente
    },
    var.tags
  )
}

resource "aws_kms_alias" "this" {
  name          = "alias/${var.aliascliente}-kms-${var.aliasproyecto}-${var.ambiente}"
  target_key_id = aws_kms_key.this.id
}

# Política por defecto para controlar acceso a la llave
data "aws_iam_policy_document" "default_policy" {
  statement {
    sid       = "Enable IAM User Permissions"
    effect    = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions   = ["kms:*"]
    resources = ["*"]
  }
}
