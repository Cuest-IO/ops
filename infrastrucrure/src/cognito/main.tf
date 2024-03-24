# Doc Cognito User Pool
resource "aws_cognito_user_pool" "doc_user_pool" {
  name = "${var.environment}-doc-cuest-user-pool"
  password_policy {
    minimum_length    = 8
    require_lowercase = true
    require_numbers   = true
    require_symbols   = true
    require_uppercase = true
  }

  tags = {
    project     = var.project_name,
    environment = var.environment
  }
}

# Doc User Pool Client
resource "aws_cognito_user_pool_client" "doc_user_pool_client" {
  name            = "${var.environment}-doc-cuest-user-pool-client"
  user_pool_id    = aws_cognito_user_pool.doc_user_pool.id
  generate_secret = true
  callback_urls   = local.doc_callback_url[*]
  logout_urls     = local.doc_logout_url[*]
}


# Console Cognito User Pool
resource "aws_cognito_user_pool" "console_user_pool" {
  name = "${var.environment}-console-cuest-user-pool"
  password_policy {
    minimum_length    = 8
    require_lowercase = true
    require_numbers   = true
    require_symbols   = true
    require_uppercase = true
  }

  tags = {
    project     = var.project_name,
    environment = var.environment
  }
}

# Console User Pool Client
resource "aws_cognito_user_pool_client" "console_user_pool_client" {
  name            = "${var.environment}-console-cuest-user-pool-client"
  user_pool_id    = aws_cognito_user_pool.console_user_pool.id
  generate_secret = true
  callback_urls   = local.console_callback_url[*]
  logout_urls     = local.console_logout_url[*]
}


# # Cognito Identity Pool
# resource "aws_cognito_identity_pool" "identity_pool" {
#   identity_pool_name               = "${var.environment}-cuest-identity-pool"
#   allow_unauthenticated_identities = false

#   cognito_identity_providers {
#     client_id               = aws_cognito_user_pool_client.user_pool_client.id
#     provider_name           = aws_cognito_user_pool.user_pool.endpoint
#     server_side_token_check = false
#   }

#   tags = {
#     project     = var.project_name,
#     environment = var.environment
#   }
# }

# # Cognito Identity Pool Roles
# resource "aws_cognito_identity_pool_roles_attachment" "identity_pool_roles" {
#   identity_pool_id = aws_cognito_identity_pool.identity_pool.id

#   roles = {
#     "authenticated"   = aws_iam_role.authenticated.arn
#     "unauthenticated" = aws_iam_role.unauthenticated.arn
#   }
# }

# # IAM Role for Authenticated Users 
# resource "aws_iam_role" "authenticated" {
#   name = "${var.environment}-cuest-authenticated-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Action = "sts:AssumeRoleWithWebIdentity",
#         Effect = "Allow",
#         Principal = {
#           Federated = "cognito-identity.amazonaws.com"
#         },
#         Condition = {
#           "StringEquals" : {
#             "cognito-identity.amazonaws.com:aud" : aws_cognito_identity_pool.identity_pool.id
#           }
#         }
#       }
#     ]
#   })
# }

# # IAM Role for Unauthenticated Users 
# resource "aws_iam_role" "unauthenticated" {
#   name = "${var.environment}-cuest-unauthenticated-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Action = "sts:AssumeRoleWithWebIdentity",
#         Effect = "Allow",
#         Principal = {
#           Federated = "cognito-identity.amazonaws.com"
#         },
#         Condition = {
#           "StringEquals" : {
#             "cognito-identity.amazonaws.com:aud" : aws_cognito_identity_pool.identity_pool.id
#           }
#         }
#       }
#     ]
#   })
# }
