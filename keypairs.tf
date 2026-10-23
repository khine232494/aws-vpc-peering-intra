locals {
  fe_private_key_filename = "${var.frontend_prefix}-ssh-key.pem"
  be_private_key_filename = "${var.backend_prefix}-ssh-key.pem"
}

resource "tls_private_key" "fe_keypair" {
  algorithm = "ED25519"
}

resource "aws_key_pair" "fe_keypair" {
  key_name   = local.fe_private_key_filename
  public_key = tls_private_key.fe_keypair.public_key_openssh
}

resource "tls_private_key" "be_keypair" {
  algorithm = "ED25519"
}

resource "aws_key_pair" "be_keypair" {
  key_name   = local.be_private_key_filename
  public_key = tls_private_key.be_keypair.public_key_openssh
}

