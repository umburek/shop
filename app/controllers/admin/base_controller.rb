module Admin
  class BaseController < ApplicationController
    before_action :authorize_admin!
    rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

    private

    def authorize_admin!
      render_404 unless current_user&.admin?
    end

    def render_404
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end

    def not_destroyed(e)
      render json: {errors: e.record.errors}, status: :unprocessable_entity
    end
  end
end