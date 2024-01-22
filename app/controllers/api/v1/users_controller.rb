# frozen_string_literal: true

module Api
  module V1
    class UsersController < Api::V1::ApiController
      include Pagy::Backend

      before_action :auth_user
      after_action { pagy_headers_merge(@pagy) if @pagy }

      def show; end

      def all
        @pagy, @users = pagy(User.all)
      end

      def update
        current_user.update!(user_params)
        render :show
      end

      private

      def auth_user
        authorize current_user
      end

      def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email)
      end
    end
  end
end
