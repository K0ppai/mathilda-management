class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, 'lajsdfi102909h901h2f')
  end

  def decoded_token
    header = request.headers['Authorization']
    return unless header

    token = header.split[1]
    begin
      JWT.decode(token, 'lajsdfi102909h901h2f', true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end

  def current_user
    return unless decoded_token

    user_id = decoded_token[0]['user_id']
    @user = User.find_by(id: user_id)
  end

  def authorized
    return unless current_user.nil?

    render json: { message: 'Please log in' }, status: :unauthorized
  end
end
