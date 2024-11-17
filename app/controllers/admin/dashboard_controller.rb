class Admin::DashboardController < ApplicationController
  include HttpBasicAuth
  before_action :authenticate_admin_http_basic
  
  def show
    @product_count = Product.sum(:quantity)
    @category_count = Category.count()
  end
end
