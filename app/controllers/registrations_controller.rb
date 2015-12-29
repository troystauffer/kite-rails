require 'net/http'
require 'uri'

class RegistrationsController < ApplicationController
  def create
    uri = URI.parse("http://kite-api.herokuapp.com/v1/account")
    response = Net::HTTP.post_form(uri, registration_params)
    if response.code == "400"
      # handle error (response.body["message"])
      redirect_to new_registration_path
    elsif response.code == "201"
      redirect_to login_path
    else
      redirect_to new_registration_path
    end
  end

  private

  def registration_params
    params.require(:firstname)
    params.require(:lastname)
    params.require(:email)
    params.require(:password)
    params.permit(:firstname, :lastname, :email, :password)
  end
end