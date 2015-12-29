require 'net/http'
require 'uri'

class SessionsController < ApplicationController
  def create
    uri = URI.parse("http://kite-api.herokuapp.com/v1/login")
    response = Net::HTTP.post_form(uri, login_params)
    if response.code == "200"
      log_in(response.body)
      redirect_to root_path
    end
  end

  private

  def login_params
    params.require(:email)
    params.require(:password)
    params.permit(:email, :password)
  end
end
