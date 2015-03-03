module Api
  class PagesController < Api::BaseController

    private

      def page_params
        params.require(:page).permit(:title, :slug, :body)
      end

      def query_params
        # this assumes that an page belongs to an artist and has an :artist_id
        # allowing us to filter by this
        params.permit(:title, :slug, :body)
      end

  end
end
