class ProductsController < ApplicationController
  before_filter :set_product, only: [:show]

  def index
    @products = Product.where(sold: [false, nil]).order("RAND()").first(12)
  end

  def show
  end

  private

  def set_product
    @product ||= Product.find(params[:id])
  end
end
