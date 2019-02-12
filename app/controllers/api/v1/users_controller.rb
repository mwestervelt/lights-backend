class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
  end 

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    @country = Country.find_by(abbreviation: user_params[:country_code])
    name = user_params[:name]
    email = user_params[:email]
    password = user_params[:password]
    @user = User.create(name: name, email: email, password: password, country: @country)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :country_code)
  end
end
