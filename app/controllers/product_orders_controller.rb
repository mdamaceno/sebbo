class ProductOrdersController < ApplicationController
  before_filter :set_product_order, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  def index
    @product_orders = ProductOrder.where(user_id: current_user.id)
  end

  def show
  end

  def edit
  end

  def new
    @product_order = ProductOrder.new
  end

  def create
    @product_order = ProductOrder.new(product_order_params)
    respond_to do |format|
      @product_order.user_id = current_user.id
      if @product_order.save
        format.html { redirect_to product_orders_path, notice: 'Produto adicionado com sucesso.' }
      else
        format.html { redirect_to product_path(@product_order.product_id), notice: 'Não possível adicionar o produto.' }
      end
    end
  end

  def update
    respond_to do |format|
      if @product_order.update(product_order_params)
        format.html { redirect_to orders_path, notice: 'Produto atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @product_order }
      else
        format.html { render :edit }
        format.json { render json: @product_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @product_order.destroy
        format.html { redirect_to product_orders_path, notice: 'Produto removido com sucesso.' }
        format.json { render :show, status: :ok }
      else
        format.html { redirect_to orders_path }
        format.json { render json: @product_order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_product_order
    @product_order ||= ProductOrder.find(params[:id])
  end

  def product_order_params
    params.require(:product_order).permit(
      :product_id, :product_name, :product_description, :product_price,
      :product_quantity, :user_id, :order_id
    )
  end
end
