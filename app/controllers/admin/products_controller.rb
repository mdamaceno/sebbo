module Admin
  class ProductsController < Admin::ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    # before_action :check_permission, except: [:new, :edit, :create, :update, :destroy]

    def index
      if current_user.role == "Administrador"
        @products = Product.all
      else
        @products = Product.where(user_id: current_user.id)
      end
    end

    def show
    end

    def new
      @product = Product.new
    end

    def edit
    end

    def create
      @product = Product.new(product_params)

      respond_to do |format|
        if @product.save
          format.html { redirect_to admin_products_path, notice: "Produto criado com sucesso." }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to admin_products_path, notice: 'Produto atualizado com sucesso.' }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { render :edit }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy

    end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :code, :slug, :image,
                                      :price, :sold, :quantity, :featured, :user_id, :category_id)
    end

  end
end
