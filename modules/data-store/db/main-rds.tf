# Define a DB subnet group
resource "aws_db_subnet_group" "db-sub-grp" {
  name       = "${var.project_name}-db-sub-grp"
  subnet_ids = var.subnets_ids
}

resource "aws_db_instance" "db" {
  allocated_storage      = var.db_allocated_storage
  storage_type           = var.db_storage_type
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  identifier             = "${var.project_name}-db"
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = var.db_parameter_group_name
  db_subnet_group_name   = aws_db_subnet_group.db-sub-grp.name
  vpc_security_group_ids = ["${aws_security_group.db-sg.id}"]
  multi_az               = var.db_multi_az
  skip_final_snapshot    = var.db_skip_final_snapshot
  publicly_accessible    = var.db_publicly_accessible

  # Prevent accidental destruction and ignore all changes
  lifecycle {
    prevent_destroy = true
    ignore_changes  = all
  }
}

