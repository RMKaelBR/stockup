class ApplicationController < ActionController::API
  JWT_SECRET_KEY = ENV['JWT_SECRET_KEY']

  private

  def require_login
    token = request.headers['Authorization']&.split(' ')&.last
    # puts "Token received: #{token}"
    # puts "JWT_SECRET_KEY = #{JWT_SECRET_KEY}"
    begin
      decoded_token = JWT.decode(token, JWT_SECRET_KEY, true, algorithm: 'HS256')
      user_id = decoded_token[0]['sub']
      @current_user = User.find(user_id)
    rescue JWT::DecodeError
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end  
end
