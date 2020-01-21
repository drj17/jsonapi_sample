require 'jsonapi'

JSONAPI::Rails.install!

Ransack.configure do |c|
  c.sanitize_custom_scope_booleans = false
end