module Api
  class ProductsController < Api::BaseController

    private

      def product_params
        params.require(:product).permit(:name, :description, :code, :slug, :price, :sold, :quantity, :featured, :user_id, :category_id)
      end

      def query_params
        # this assumes that an product belongs to an artist and has an :artist_id
        # allowing us to filter by this
        params.permit(:name, :description, :code, :slug, :price, :sold, :quantity, :featured, :user_id, :category_id)
      end

  end
end
