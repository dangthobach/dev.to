# Specify which environments to use Hypershield
# Optional to setup, can help shield sensitive data for
# tools like Blazer.
# further setup instructions: https://github.com/ankane/hypershield#database-setup

# Validate that hypershield schema exists before trying to use it
if Rails.env.production?
  if ActiveRecord::Base.connection.schema_exists?("hypershield")
    # Specify the schema to use and columns to show and hide
    Hypershield.schemas = {
      hypershield: {
        # columns to hide
        # matches table.column
        hide: %w[
          auth_data_dump
          email
          encrypted
          encrypted_password
          message_html
          message_markdown
          password
          previous_refresh_token
          refresh_token
          secret
          token
          current_sign_in_ip
          last_sign_in_ip
          reset_password_token
          remember_token
          unconfirmed_email
        ]
      }
    }

    # Log SQL statements
    Hypershield.log_sql = false
  end
end
