class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "Book"
  def show
    @products = Product.all
    @categories = Category.all
  end
end
