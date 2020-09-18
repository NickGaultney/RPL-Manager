class Api::ApiController < ApplicationController
  before_action :authenticate

  protected

  def authenticate
    api_token = request.headers['X-Api-Token']
    Rails.logger.info api_token

    @user = User.find_by(api_token: api_token) if api_token

    unless @user
      head status: :unauthorized
      return false
    end
  end
end