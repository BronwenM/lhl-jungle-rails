#Provides reusable 'authenticate_http_basic' method for pages that need admin authentication
module HttpBasicAuth
  extend ActiveSupport::Concern

  included do
    def authenticate_admin_http_basic
      return if authenticate_with_http_basic { |username, password| authenticate_admin(username, password) }
      request_http_basic_authentication
    end

    private

    def authenticate_admin(username, password)
      username == ENV["ADMIN_USERNAME"] && password == ENV["ADMIN_PASSWORD"]
    end
  end
end