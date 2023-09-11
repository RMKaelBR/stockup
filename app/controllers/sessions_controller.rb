class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])   #if user && user.valid_password?(params[:password])
      auth_token = Knock::AuthToken.new(payload: { sub: user.id })
      # puts "The auth_token value?: #{auth_token.token}"
      # puts "The JWT_SECRET_KEY used by Knock: #{Knock.token_secret_signature_key.call}"
      # puts "user.id #{user.id}"
      render json: { auth_token: auth_token.token, isAdmin: user.admin }
    else
      render json: { error: "API Authentication failed"}, status: :unauthorized
    end
  end

  def destroy
    render json: { message: "User successfully logged out."}, status: :ok
  end
end
