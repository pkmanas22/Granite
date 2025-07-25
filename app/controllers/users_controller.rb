# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    users = User.select(:id, :name)
    render_json({ users: })
  end

  def create
    user = User.new(user_params)
    user.save!
    render_notice(t("successfully_created", entity: "User"))
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
