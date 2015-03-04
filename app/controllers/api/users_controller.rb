module Api
  class UsersController < Api::BaseController

    private

      def user_params
        params.require(:user).permit(:title, :slug, :body)
      end

      def query_params
        # this assumes that an user belongs to an artist and has an :artist_id
        # allowing us to filter by this
        params.permit(:title, :slug, :body)
      end

  end
end
