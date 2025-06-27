Dbviewer.configure_pii do |pii|
  # Built-in masking types:

  # Email masking: john.doe@example.com -> jo***@example.com
  pii.mask "users.email", with: :email
  pii.mask "users.encrypted_password", with: :email

  # Custom masking with lambda/proc:
  pii.mask "users.encrypted_password", with: ->(value) {
    return value if value.nil?
    "[CUSTOM-MASKED]"
  }
end
