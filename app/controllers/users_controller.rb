# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or /users.json

  def index
    # Hide specific record from All select * type queries

    @users = User.all.where.not(email: 'super.admin@smuca.fr')
  end

  # GET /users/1 or /users/1.json

  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :job_title, :description, :phone)
  end
end
