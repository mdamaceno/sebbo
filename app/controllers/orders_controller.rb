class OrdersController < ApplicationController
  before_filter :set_order, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
    @order = Order.new
    @product_orders = ProductOrder.where(user_id: current_user.id)
    @address = Address.where(user_id: current_user.id).first
  end

  def create
    @order = Order.new(order_params)
    if user_signed_in?
      respond_to do |format|
      	@order.user_buyer_name = current_user.name
      	@order.product_price = @order.quantity * @order.product_price.to_d
        if @order.save
          format.html { redirect_to orders_path, notice: 'Pedido criado com sucesso.' }
        else
          format.html { redirect_to product_path(@order.product_id.to_i), notice: 'Não possível adicionar o produto ao pedido.' }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to product_path(@order.product_id.to_i), notice: 'Você não está logado.' }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to [:admin, @order], notice: 'Pedido atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

  end

  private

  def set_order
    @order ||= Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(
      :day_of_payment, :quantity, :user_seller_name, :user_buyer_name,
      :user_seller_cpf, :user_buyer_cpf, :payment_method, :address, :zipcode,
      :state, :city, :product_id, :product_name, :product_description,
      :product_price
    )
  end
end
