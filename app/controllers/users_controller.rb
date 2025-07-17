class UsersController < ApplicationController
  # before_action :authenticate_request, except: [ :create ]

  def index
    users = User.all
    render json: UserBlueprint.render(users, view: :normal)
  end

  def getBlogs
    user = User.find(params[:id])
    render json: UserBlueprint.render(user, view: :blogs), status: 200
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: UserBlueprint.render(user, view: :normal), status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:username, :email, :first_name, :last_name, :password, :password_confirmation)
  end
end
